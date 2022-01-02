/*************************************************************************
Title:    Reefer Sound Module
Authors:  Michael Petersen <railfan@drgw.net>
          Nathan D. Holmes <maverick@drgw.net>
          Based on the work of David Johnson-Davies - www.technoblogy.com - 23rd October 2017
           and used under his Creative Commons Attribution 4.0 International license
File:     $Id: $
License:  GNU General Public License v3

CREDIT:
    The basic idea behind this playback design came from David Johson-Davies, who
    provided the basic framework and the place where I started.

LICENSE:
    Copyright (C) 2021 Michael Petersen, Nathan Holmes, with portions from 
     David Johson-Davies under a Creative Commons Attribution 4.0 license

    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 3 of the License, or
    any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

*************************************************************************/

#include <avr/io.h>
#include <avr/interrupt.h>
#include <avr/wdt.h>
#include <util/delay.h>
#include <avr/pgmspace.h>
#include <avr/sleep.h>

#include "reefer.h"

// playBell acts as an indicator between the main loop and 
// the ISR to tell it to shut down playback once it hits the end
// of the bell sound sample

volatile uint8_t playBell = 0;

inline void disableAmplifier()
{
	PORTB &= ~_BV(PB4);
}

inline void enableAmplifier()
{
	PORTB |= _BV(PB4);
}

// 16kHz interrupt to load high speed PWMs
ISR(TIMER0_COMPA_vect) 
{
	static int16_t wavIdx = 0;
	uint8_t data = 0x7F;

	static uint8_t nextOCR1A = 0x7F;
	OCR1A = nextOCR1A;

	data = pgm_read_byte(&wav[wavIdx++]);
	if (wavIdx == wav_len)
	{
		wavIdx = 0;
	}

	nextOCR1A = data;
}

ISR(PCINT0_vect) { }  // Used for waking from sleep

int main(void)
{
	// Deal with watchdog first thing
	MCUSR = 0;								// Clear reset status

	wdt_reset();                     // Reset the WDT, just in case it's still enabled over reset
	wdt_enable(WDTO_1S);             // Enable it at a 1S timeout.

	// Enable 64 MHz PLL and use as source for Timer1
	PLLCSR = _BV(PCKE) | _BV(PLLE);

	// Set up Timer/Counter1 for PWM output on PB1 (OCR1A)
	TIMSK = 0;                                    // Timer interrupts OFF
	TCCR1 = _BV(PWM1A) | _BV(COM1A1) | _BV(CS10); // PWM A, clear on match, 1:1 prescale
	OCR1A = 0x7F;                                 // 50% duty at start

	// Set up Timer/Counter0 for interrupts to output samples.
	TCCR0A = _BV(WGM00) | _BV(WGM01);             // Fast PWM (also needs WGM02 in TCCR0B)
	TCCR0B = _BV(WGM02) | _BV(CS01);              // 1/8 prescale
	// 8MHz / 8 / 63 = 15.873kHz
//	OCR0A = 63;
	// 8MHz / 8 / 83 = 12.048kHz
	OCR0A = 83;

	DDRB = _BV(PB4) | _BV(PB1);
	PORTB |= _BV(PB3);                            // Turn on pullup for PB3 (enable input)
	PORTB |= _BV(PB0); // FIXME
	disableAmplifier();
	sei();

	wdt_reset();
	_delay_ms(400);  // Wait for PWM and PB3 to settle

	uint8_t state = 0;
	
	uint8_t pin;
	uint8_t oldPin = _BV(PB3);

	while(1)
	{
		wdt_reset();

		switch(state)
		{
			case 0:
			default:
				// Idle & off
				disableAmplifier();
				playBell = 0;
				TIMSK = 0;

				GIMSK |= _BV(PCIE);
				PCMSK |= _BV(PCINT3);
				wdt_reset();
				wdt_disable();                         // Disable watchdog so it doesn't reset us in sleep
				set_sleep_mode(SLEEP_MODE_PWR_DOWN);
				sleep_enable();
				sei();
				sleep_cpu();
				cli();
				PCMSK &= ~_BV(PCINT3);
				sleep_disable();
				wdt_reset();
				wdt_enable(WDTO_1S);          // Reenable watchdog
				wdt_reset();
				sei();
				
//				pin = PINB & _BV(PB3);
//				if(!pin && oldPin)  // Falling edge detect
//				{
					state = 1;  // Go to playing
//				}
//				oldPin = pin;
				break;
			case 1:
				// Playing
				enableAmplifier();
				playBell = 1;
				TIMSK = _BV(OCIE0A);

				pin = PINB & _BV(PB3);
				if(!pin && oldPin)  // Falling edge detect
				{
//					state = 0;  // Go to off
				}
				oldPin = pin;
				break;
		}

	}
	
}

