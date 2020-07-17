v 20130925 2
T 25400 7900 9 10 1 0 0 0 1
Micro Sized Sound Player
T 25300 7600 9 10 1 0 0 0 1
ckt-reefer.sch
T 25500 7300 9 10 1 0 0 0 1
1
T 27000 7300 9 10 1 0 0 0 1
1
T 29300 7300 9 10 1 0 0 0 1
Michael Petersen
N 25700 15100 27000 15100 4
N 25700 14900 27000 14900 4
N 25700 14300 29000 14300 4
C 17700 15300 1 0 1 header2-1.sym
{
T 16700 15950 5 10 0 0 0 6 1
device=HEADER2
T 17200 16200 5 10 1 1 0 3 1
refdes=BAT
T 17700 15300 5 10 0 0 0 0 1
footprint=KEYSTONE_55_AAA
}
C 19700 14400 1 0 0 ltc3525.sym
{
T 20800 15600 5 10 1 1 0 4 1
device=LTC3525-3
T 21600 16250 5 10 1 1 0 6 1
refdes=U1
T 20000 16250 5 10 0 1 0 0 1
footprint=LTC_SC6
}
N 17700 15900 19700 15900 4
C 19000 15400 1 90 1 capacitor-1.sym
{
T 18300 15200 5 10 0 1 270 2 1
device=CAPACITOR
T 18100 15200 5 10 0 0 270 2 1
symversion=0.1
T 18700 14200 5 10 0 1 0 6 1
footprint=0805
T 18700 15100 5 10 1 1 0 6 1
refdes=C1
T 18700 14600 5 10 1 1 0 6 1
value=1uF
T 18700 14400 5 10 1 1 0 6 1
comment=6.3V
}
N 18800 15900 18800 15400 4
N 18800 14000 18800 14500 4
C 20700 13500 1 0 0 gnd-1.sym
N 18000 14000 23700 14000 4
N 19500 14000 19500 14700 4
N 19500 14700 19700 14700 4
N 20800 13800 20800 14000 4
N 22100 14000 22100 14700 4
N 22100 14700 21900 14700 4
N 18000 14000 18000 15500 4
N 18000 15500 17700 15500 4
N 19700 15300 19200 15300 4
N 19200 15300 19200 15900 4
C 20300 16900 1 0 0 inductor-1.sym
{
T 20500 17400 5 10 0 0 0 0 1
device=INDUCTOR
T 20500 17600 5 10 0 0 0 0 1
symversion=0.1
T 20300 16900 5 10 0 0 0 0 1
footprint=XPL2010
T 20750 17150 5 10 1 1 0 3 1
refdes=L1
T 20750 16700 5 10 1 1 0 5 1
model=XPL2010-682
T 20750 16900 5 10 1 1 0 5 1
value=6.8uH
}
N 19500 15900 19500 17000 4
N 19500 17000 20300 17000 4
N 21200 17000 22100 17000 4
N 22100 15900 22100 17000 4
N 22100 15900 21900 15900 4
C 22500 15100 1 270 0 capacitor-1.sym
{
T 23200 14900 5 10 0 1 270 0 1
device=CAPACITOR
T 23400 14900 5 10 0 0 270 0 1
symversion=0.1
T 22800 13900 5 10 0 1 0 0 1
footprint=0805
T 22800 14800 5 10 1 1 0 0 1
refdes=C2
T 22800 14300 5 10 1 1 0 0 1
value=10uF
T 22800 14100 5 10 1 1 0 0 1
comment=6.3V
}
N 22700 14200 22700 14000 4
N 22700 15100 22700 15300 4
N 21900 15300 23900 15300 4
C 15500 7000 0 0 0 title-bordered-B.sym
C 25700 14100 1 0 1 ATtiny85.sym
{
T 24400 15550 5 10 1 1 0 6 1
refdes=U2
T 25425 16750 5 10 0 0 0 6 1
footprint=SO8
T 24800 15550 5 10 1 1 0 0 1
device=ATtiny85
}
N 23900 14300 23700 14300 4
N 23700 14300 23700 14000 4
N 27400 15900 23700 15900 4
N 23700 15300 23700 16100 4
C 28800 14900 1 0 1 avrprog-1.sym
{
T 28800 16500 5 10 0 1 0 6 1
device=AVRPROG
T 28800 14900 5 10 0 0 0 6 1
footprint=TC2030-NL
T 28200 16200 5 10 1 1 0 6 1
refdes=J1
}
C 27200 14700 1 0 0 gnd-1.sym
N 27000 15100 27000 16500 4
N 27000 16500 29000 16500 4
N 29000 16500 29000 15900 4
N 29000 15900 28800 15900 4
N 27000 14600 27000 14900 4
N 27000 14600 29200 14600 4
N 29200 14600 29200 15500 4
N 29200 15500 28800 15500 4
N 27400 15100 27300 15100 4
N 27300 15100 27300 15000 4
N 28800 15100 29000 15100 4
N 29000 15100 29000 14300 4
N 25700 15300 26800 15300 4
N 26800 15300 26800 15500 4
N 26800 15500 27400 15500 4
N 26000 11700 26000 15100 4
C 23500 16100 1 0 0 vdd-1.sym
C 23500 9900 1 0 1 pam8301.sym
{
T 22400 11200 5 10 1 1 0 4 1
device=PAM8301
T 21600 12250 5 10 1 1 0 0 1
refdes=U3
T 21500 10200 5 10 0 1 0 6 1
footprint=LTC_S6
}
C 22600 12700 1 0 1 vdd-1.sym
N 22400 12700 22400 12500 4
C 22500 9400 1 0 1 gnd-1.sym
N 22400 9700 22400 9900 4
N 23500 10700 26500 10700 4
N 26500 10700 26500 14500 4
N 26500 14500 25700 14500 4
C 24800 11500 1 0 0 capacitor-1.sym
{
T 25000 12200 5 10 0 1 0 0 1
device=CAPACITOR
T 25000 12400 5 10 0 0 0 0 1
symversion=0.1
T 26000 11800 5 10 0 1 90 0 1
footprint=0805
T 25250 12000 5 10 1 1 0 3 1
refdes=C3
T 25250 11400 5 10 1 1 0 5 1
value=0.1uF
T 25250 11200 5 10 1 1 0 5 1
comment=6.3V
}
N 26000 11700 25700 11700 4
N 23700 11700 23500 11700 4
N 24600 11700 24800 11700 4
C 23700 11600 1 0 0 resistor-1.sym
{
T 24000 12000 5 10 0 0 0 0 1
device=RESISTOR
T 23700 11600 5 10 0 0 0 0 1
footprint=0805
T 24200 11900 5 10 1 1 0 3 1
refdes=R1
T 24200 11500 5 10 1 1 0 5 1
value=100k
}
C 20000 10800 1 0 1 header2-1.sym
{
T 19000 11450 5 10 0 0 0 6 1
device=HEADER2
T 19500 11700 5 10 1 1 0 3 1
refdes=SPK
T 20000 10800 5 10 0 0 0 0 1
footprint=JUMPER2
}
N 21300 11700 20700 11700 4
N 20700 11700 20700 11400 4
N 20700 11400 20000 11400 4
N 21300 10700 20700 10700 4
N 20700 10700 20700 11000 4
N 20700 11000 20000 11000 4