# ALL03_PP
Hi-Lo ALL-03 and MOD-EMUP programmers parallel port interface using the ATF-1502 CPLD
This is a circuit that allows to use the Hi-Lo ALL-03 (and clones like the
MOD-EMUP) universal programmers/testers via the parallel port interface
using a patched DOSBOX. Original design by Nicola Di Lieto used an EPM7032
CPLD. I've used an ATF1502 CPLD that's still (as of December 2023) in 
production.

*** The JTAG port has a non-standard pinout *** 


The 2SB794 PNP darlington transistor can be substituted with a similar PNP
darlington. Using a normal PNP transistor with HFE < 200 makes this switching
voltage inverter misbehave. You can attempt to change the base resistor from
4k7 ohms to 2k2 ohms to make a lower HFE transistor work.

USE AT YOUR OWN RISK! 
