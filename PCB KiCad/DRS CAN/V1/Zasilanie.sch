EESchema Schematic File Version 4
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 3
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Device:L L2
U 1 1 5CD867E0
P 4300 1900
F 0 "L2" V 4490 1900 50  0000 C CNN
F 1 "33u" V 4399 1900 50  0000 C CNN
F 2 "Inductor_SMD:L_12x12mm_H8mm" H 4300 1900 50  0001 C CNN
F 3 "~" H 4300 1900 50  0001 C CNN
	1    4300 1900
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED D8
U 1 1 5CD867E6
P 5450 2150
F 0 "D8" V 5489 2033 50  0000 R CNN
F 1 "LED" V 5398 2033 50  0000 R CNN
F 2 "LED_SMD:LED_1206_3216Metric" H 5450 2150 50  0001 C CNN
F 3 "~" H 5450 2150 50  0001 C CNN
	1    5450 2150
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2850 1700 2550 1700
Wire Wire Line
	2150 1700 2150 2000
Wire Wire Line
	2550 2000 2550 1700
Connection ~ 2550 1700
Wire Wire Line
	2150 2300 2150 2850
Wire Wire Line
	2150 2850 2550 2850
Wire Wire Line
	5450 2850 5450 2750
Wire Wire Line
	4700 2300 4700 2850
Connection ~ 4700 2850
Wire Wire Line
	4000 2300 4000 2850
Connection ~ 4000 2850
Wire Wire Line
	4000 2850 4700 2850
Wire Wire Line
	4700 2000 4700 1900
Wire Wire Line
	3850 1700 4000 1700
Wire Wire Line
	3850 1900 4000 1900
Wire Wire Line
	4450 1900 4700 1900
Connection ~ 4700 1900
Wire Wire Line
	5450 1900 5450 2000
Wire Wire Line
	5450 2300 5450 2450
Wire Wire Line
	4000 2000 4000 1900
Connection ~ 4000 1900
Wire Wire Line
	4000 1900 4150 1900
Wire Wire Line
	2550 2300 2550 2850
Connection ~ 2550 2850
Wire Wire Line
	2550 2850 2800 2850
Wire Wire Line
	2850 1900 2800 1900
Wire Wire Line
	2800 1900 2800 2850
Connection ~ 2800 2850
Wire Wire Line
	2800 2850 3350 2850
Wire Wire Line
	3350 2100 3350 2850
Connection ~ 3350 2850
Wire Wire Line
	3350 2850 4000 2850
$Comp
L power:GND #PWR0105
U 1 1 5CD8680C
P 3350 2850
F 0 "#PWR0105" H 3350 2600 50  0001 C CNN
F 1 "GND" H 3355 2677 50  0000 C CNN
F 2 "" H 3350 2850 50  0001 C CNN
F 3 "" H 3350 2850 50  0001 C CNN
	1    3350 2850
	1    0    0    -1  
$EndComp
$Comp
L Device:R R10
U 1 1 5CD8681A
P 5450 2600
F 0 "R10" H 5520 2646 50  0000 L CNN
F 1 "330" H 5520 2555 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 5380 2600 50  0001 C CNN
F 3 "~" H 5450 2600 50  0001 C CNN
	1    5450 2600
	1    0    0    -1  
$EndComp
$Comp
L Device:CP1 C16
U 1 1 5CD86820
P 4700 2150
F 0 "C16" H 4815 2196 50  0000 L CNN
F 1 "220u" H 4815 2105 50  0000 L CNN
F 2 "Capacitor_SMD:CP_Elec_6.3x7.7" H 4700 2150 50  0001 C CNN
F 3 "~" H 4700 2150 50  0001 C CNN
	1    4700 2150
	1    0    0    -1  
$EndComp
$Comp
L Device:C C12
U 1 1 5CD86826
P 2550 2150
F 0 "C12" H 2665 2196 50  0000 L CNN
F 1 "100n" H 2665 2105 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 2588 2000 50  0001 C CNN
F 3 "~" H 2550 2150 50  0001 C CNN
	1    2550 2150
	1    0    0    -1  
$EndComp
$Comp
L Device:CP1 C9
U 1 1 5CD8682C
P 2150 2150
F 0 "C9" H 2265 2196 50  0000 L CNN
F 1 "100u" H 2265 2105 50  0000 L CNN
F 2 "Capacitor_SMD:CP_Elec_6.3x7.7" H 2150 2150 50  0001 C CNN
F 3 "~" H 2150 2150 50  0001 C CNN
	1    2150 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	2150 1700 2550 1700
Wire Wire Line
	4700 2850 5450 2850
Wire Wire Line
	4700 1900 5450 1900
$Comp
L Regulator_Switching:LM2596S-5 U3
U 1 1 5CD86843
P 3350 1800
F 0 "U3" H 3350 2167 50  0000 C CNN
F 1 "AP1501-K5G-13" H 3350 2076 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:TO-263-5_TabPin3" H 3400 1550 50  0001 L CIN
F 3 "http://www.ti.com/lit/ds/symlink/lm2596.pdf" H 3350 1800 50  0001 C CNN
	1    3350 1800
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Schottky D5
U 1 1 5CD86849
P 4000 2150
F 0 "D5" V 3954 2229 50  0000 L CNN
F 1 "D_Schottky" V 4045 2229 50  0000 L CNN
F 2 "Diode_SMD:D_SMB" H 4000 2150 50  0001 C CNN
F 3 "~" H 4000 2150 50  0001 C CNN
	1    4000 2150
	0    1    1    0   
$EndComp
$Comp
L Device:L L3
U 1 1 5CDA28E3
P 4300 3950
F 0 "L3" V 4490 3950 50  0000 C CNN
F 1 "33u" V 4399 3950 50  0000 C CNN
F 2 "Inductor_SMD:L_12x12mm_H8mm" H 4300 3950 50  0001 C CNN
F 3 "~" H 4300 3950 50  0001 C CNN
	1    4300 3950
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED D9
U 1 1 5CDA28E9
P 5450 4200
F 0 "D9" V 5489 4083 50  0000 R CNN
F 1 "LED" V 5398 4083 50  0000 R CNN
F 2 "LED_SMD:LED_1206_3216Metric" H 5450 4200 50  0001 C CNN
F 3 "~" H 5450 4200 50  0001 C CNN
	1    5450 4200
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2850 3750 2550 3750
Wire Wire Line
	2150 3750 2150 4050
Wire Wire Line
	2550 4050 2550 3750
Connection ~ 2550 3750
Wire Wire Line
	2150 4350 2150 4900
Wire Wire Line
	2150 4900 2550 4900
Wire Wire Line
	5450 4900 5450 4800
Wire Wire Line
	4700 4350 4700 4900
Connection ~ 4700 4900
Wire Wire Line
	4000 4350 4000 4900
Connection ~ 4000 4900
Wire Wire Line
	4000 4900 4700 4900
Wire Wire Line
	4700 4050 4700 3950
Wire Wire Line
	3850 3750 4000 3750
Wire Wire Line
	3850 3950 4000 3950
Wire Wire Line
	4450 3950 4700 3950
Connection ~ 4700 3950
Wire Wire Line
	5450 3950 5450 4050
Wire Wire Line
	5450 4350 5450 4500
Wire Wire Line
	4000 4050 4000 3950
Connection ~ 4000 3950
Wire Wire Line
	4000 3950 4150 3950
Wire Wire Line
	2550 4350 2550 4900
Connection ~ 2550 4900
Wire Wire Line
	2550 4900 2800 4900
Wire Wire Line
	2850 3950 2800 3950
Wire Wire Line
	2800 3950 2800 4900
Connection ~ 2800 4900
Wire Wire Line
	2800 4900 3350 4900
Wire Wire Line
	3350 4150 3350 4900
Connection ~ 3350 4900
Wire Wire Line
	3350 4900 4000 4900
$Comp
L power:GND #PWR0116
U 1 1 5CDA290F
P 3350 4900
F 0 "#PWR0116" H 3350 4650 50  0001 C CNN
F 1 "GND" H 3355 4727 50  0000 C CNN
F 2 "" H 3350 4900 50  0001 C CNN
F 3 "" H 3350 4900 50  0001 C CNN
	1    3350 4900
	1    0    0    -1  
$EndComp
$Comp
L Device:R R12
U 1 1 5CDA291D
P 5450 4650
F 0 "R12" H 5520 4696 50  0000 L CNN
F 1 "330" H 5520 4605 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 5380 4650 50  0001 C CNN
F 3 "~" H 5450 4650 50  0001 C CNN
	1    5450 4650
	1    0    0    -1  
$EndComp
$Comp
L Device:CP1 C17
U 1 1 5CDA2923
P 4700 4200
F 0 "C17" H 4815 4246 50  0000 L CNN
F 1 "220u" H 4815 4155 50  0000 L CNN
F 2 "Capacitor_SMD:CP_Elec_6.3x7.7" H 4700 4200 50  0001 C CNN
F 3 "~" H 4700 4200 50  0001 C CNN
	1    4700 4200
	1    0    0    -1  
$EndComp
$Comp
L Device:C C13
U 1 1 5CDA2929
P 2550 4200
F 0 "C13" H 2665 4246 50  0000 L CNN
F 1 "100n" H 2665 4155 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 2588 4050 50  0001 C CNN
F 3 "~" H 2550 4200 50  0001 C CNN
	1    2550 4200
	1    0    0    -1  
$EndComp
$Comp
L Device:CP1 C10
U 1 1 5CDA292F
P 2150 4200
F 0 "C10" H 2265 4246 50  0000 L CNN
F 1 "100u" H 2265 4155 50  0000 L CNN
F 2 "Capacitor_SMD:CP_Elec_6.3x7.7" H 2150 4200 50  0001 C CNN
F 3 "~" H 2150 4200 50  0001 C CNN
	1    2150 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	2150 3750 2550 3750
Wire Wire Line
	4700 4900 5450 4900
Wire Wire Line
	4700 3950 5450 3950
$Comp
L Regulator_Switching:LM2596S-5 U4
U 1 1 5CDA2946
P 3350 3850
F 0 "U4" H 3350 4217 50  0000 C CNN
F 1 "AP1501-K5G-13" H 3350 4126 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:TO-263-5_TabPin3" H 3400 3600 50  0001 L CIN
F 3 "http://www.ti.com/lit/ds/symlink/lm2596.pdf" H 3350 3850 50  0001 C CNN
	1    3350 3850
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Schottky D6
U 1 1 5CDA294C
P 4000 4200
F 0 "D6" V 3954 4279 50  0000 L CNN
F 1 "D_Schottky" V 4045 4279 50  0000 L CNN
F 2 "Diode_SMD:D_SMB" H 4000 4200 50  0001 C CNN
F 3 "~" H 4000 4200 50  0001 C CNN
	1    4000 4200
	0    1    1    0   
$EndComp
$Comp
L Device:LED D12
U 1 1 5CDA51F9
P 8850 2000
F 0 "D12" V 8889 1883 50  0000 R CNN
F 1 "LED" V 8798 1883 50  0000 R CNN
F 2 "LED_SMD:LED_1206_3216Metric" H 8850 2000 50  0001 C CNN
F 3 "~" H 8850 2000 50  0001 C CNN
	1    8850 2000
	-1   0    0    1   
$EndComp
$Comp
L Device:R R13
U 1 1 5CDA5202
P 9100 2250
F 0 "R13" H 9170 2296 50  0000 L CNN
F 1 "2k" H 9170 2205 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 9030 2250 50  0001 C CNN
F 3 "~" H 9100 2250 50  0001 C CNN
	1    9100 2250
	1    0    0    -1  
$EndComp
$Comp
L power:+5VP #PWR0123
U 1 1 5CDAAB9F
P 5450 1900
F 0 "#PWR0123" H 5450 1750 50  0001 C CNN
F 1 "+5VP" H 5465 2073 50  0000 C CNN
F 2 "" H 5450 1900 50  0001 C CNN
F 3 "" H 5450 1900 50  0001 C CNN
	1    5450 1900
	1    0    0    -1  
$EndComp
$Comp
L power:+5VL #PWR0128
U 1 1 5CDAB4BC
P 5450 3950
F 0 "#PWR0128" H 5450 3800 50  0001 C CNN
F 1 "+5VL" H 5465 4123 50  0000 C CNN
F 2 "" H 5450 3950 50  0001 C CNN
F 3 "" H 5450 3950 50  0001 C CNN
	1    5450 3950
	1    0    0    -1  
$EndComp
Connection ~ 5450 3950
Connection ~ 5450 1900
$Comp
L Regulator_Linear:LM1117-5.0 U5
U 1 1 5CDADB9A
P 3250 5700
F 0 "U5" H 3250 5942 50  0000 C CNN
F 1 "LM1117-5.0" H 3250 5851 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-223-3_TabPin2" H 3250 5700 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm1117.pdf" H 3250 5700 50  0001 C CNN
	1    3250 5700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0130
U 1 1 5CDAF2C3
P 3250 6100
F 0 "#PWR0130" H 3250 5850 50  0001 C CNN
F 1 "GND" H 3255 5927 50  0000 C CNN
F 2 "" H 3250 6100 50  0001 C CNN
F 3 "" H 3250 6100 50  0001 C CNN
	1    3250 6100
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0132
U 1 1 5CDAF85D
P 3750 5650
F 0 "#PWR0132" H 3750 5500 50  0001 C CNN
F 1 "+5V" H 3765 5823 50  0000 C CNN
F 2 "" H 3750 5650 50  0001 C CNN
F 3 "" H 3750 5650 50  0001 C CNN
	1    3750 5650
	1    0    0    -1  
$EndComp
Wire Wire Line
	8550 2500 8550 2450
$Comp
L power:GND #PWR?
U 1 1 5CDB8547
P 8550 2500
AR Path="/5CDB8547" Ref="#PWR?"  Part="1" 
AR Path="/5CD7837A/5CDB8547" Ref="#PWR0133"  Part="1" 
F 0 "#PWR0133" H 8550 2250 50  0001 C CNN
F 1 "GND" H 8555 2327 50  0000 C CNN
F 2 "" H 8550 2500 50  0001 C CNN
F 3 "" H 8550 2500 50  0001 C CNN
	1    8550 2500
	1    0    0    -1  
$EndComp
Connection ~ 8550 2000
Wire Wire Line
	8550 2000 8550 2100
Wire Wire Line
	8450 2000 8550 2000
Wire Wire Line
	7500 2000 7650 2000
Wire Wire Line
	7950 2000 8150 2000
$Comp
L Device:D_Zener D?
U 1 1 5CDB855E
P 8550 2250
AR Path="/5CDB855E" Ref="D?"  Part="1" 
AR Path="/5CD7837A/5CDB855E" Ref="D11"  Part="1" 
F 0 "D11" V 8504 2329 50  0000 L CNN
F 1 "D_Zener" V 8595 2329 50  0000 L CNN
F 2 "Diode_SMD:D_SMB" H 8550 2250 50  0001 C CNN
F 3 "~" H 8550 2250 50  0001 C CNN
	1    8550 2250
	0    1    1    0   
$EndComp
$Comp
L Device:D_Schottky D?
U 1 1 5CDB8564
P 8300 2000
AR Path="/5CDB8564" Ref="D?"  Part="1" 
AR Path="/5CD7837A/5CDB8564" Ref="D10"  Part="1" 
F 0 "D10" H 8300 1784 50  0000 C CNN
F 1 "D_Schottky" H 8300 1875 50  0000 C CNN
F 2 "Diode_SMD:D_SMB" H 8300 2000 50  0001 C CNN
F 3 "~" H 8300 2000 50  0001 C CNN
	1    8300 2000
	-1   0    0    1   
$EndComp
$Comp
L Device:Fuse F?
U 1 1 5CDB856A
P 7800 2000
AR Path="/5CDB856A" Ref="F?"  Part="1" 
AR Path="/5CD7837A/5CDB856A" Ref="F1"  Part="1" 
F 0 "F1" V 7603 2000 50  0000 C CNN
F 1 "Fuse" V 7694 2000 50  0000 C CNN
F 2 "Diode_SMD:D_SMB" V 7730 2000 50  0001 C CNN
F 3 "~" H 7800 2000 50  0001 C CNN
	1    7800 2000
	0    1    1    0   
$EndComp
$Comp
L Device:CP C14
U 1 1 5CDBA27F
P 2750 5900
F 0 "C14" H 2868 5946 50  0000 L CNN
F 1 "CP" H 2868 5855 50  0000 L CNN
F 2 "Diode_SMD:D_SMB" H 2788 5750 50  0001 C CNN
F 3 "~" H 2750 5900 50  0001 C CNN
	1    2750 5900
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C15
U 1 1 5CDBAD80
P 3750 5900
F 0 "C15" H 3868 5946 50  0000 L CNN
F 1 "CP" H 3868 5855 50  0000 L CNN
F 2 "Diode_SMD:D_SMB" H 3788 5750 50  0001 C CNN
F 3 "~" H 3750 5900 50  0001 C CNN
	1    3750 5900
	1    0    0    -1  
$EndComp
Wire Wire Line
	3750 6050 3250 6050
Wire Wire Line
	3250 6050 3250 6000
Wire Wire Line
	3250 6050 3250 6100
Connection ~ 3250 6050
Wire Wire Line
	3250 6050 2750 6050
Wire Wire Line
	2750 5750 2750 5700
Wire Wire Line
	2750 5700 2950 5700
Connection ~ 2750 5700
Wire Wire Line
	2750 5700 2750 5650
Wire Wire Line
	3550 5700 3750 5700
Wire Wire Line
	3750 5700 3750 5650
Wire Wire Line
	3750 5750 3750 5700
Connection ~ 3750 5700
Wire Wire Line
	8550 2000 8550 1950
Wire Wire Line
	9100 2000 9000 2000
Wire Wire Line
	8550 2000 8700 2000
Wire Wire Line
	9100 2450 8550 2450
Connection ~ 8550 2450
Wire Wire Line
	8550 2450 8550 2400
Wire Wire Line
	9100 2450 9100 2400
Wire Wire Line
	9100 2100 9100 2000
$Comp
L Device:LED D7
U 1 1 5CDD7D46
P 4100 5700
F 0 "D7" V 4139 5583 50  0000 R CNN
F 1 "LED" V 4048 5583 50  0000 R CNN
F 2 "LED_SMD:LED_1206_3216Metric" H 4100 5700 50  0001 C CNN
F 3 "~" H 4100 5700 50  0001 C CNN
	1    4100 5700
	-1   0    0    1   
$EndComp
$Comp
L Device:R R9
U 1 1 5CDD8C1B
P 4450 5850
F 0 "R9" H 4520 5896 50  0000 L CNN
F 1 "330" H 4520 5805 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 4380 5850 50  0001 C CNN
F 3 "~" H 4450 5850 50  0001 C CNN
	1    4450 5850
	1    0    0    -1  
$EndComp
Wire Wire Line
	3750 6050 4450 6050
Wire Wire Line
	4450 6050 4450 6000
Connection ~ 3750 6050
Wire Wire Line
	4450 5700 4250 5700
Wire Wire Line
	3950 5700 3750 5700
$Comp
L Device:R R8
U 1 1 5CDDFC5F
P 1950 1700
F 0 "R8" V 1743 1700 50  0000 C CNN
F 1 "0R" V 1834 1700 50  0000 C CNN
F 2 "Resistor_SMD:R_2010_5025Metric" V 1880 1700 50  0001 C CNN
F 3 "~" H 1950 1700 50  0001 C CNN
	1    1950 1700
	0    1    1    0   
$EndComp
$Comp
L Device:R R7
U 1 1 5CDE167D
P 1900 3750
F 0 "R7" V 1693 3750 50  0000 C CNN
F 1 "0R" V 1784 3750 50  0000 C CNN
F 2 "Resistor_SMD:R_2010_5025Metric" V 1830 3750 50  0001 C CNN
F 3 "~" H 1900 3750 50  0001 C CNN
	1    1900 3750
	0    1    1    0   
$EndComp
Wire Wire Line
	1750 3750 1700 3750
Wire Wire Line
	1700 3750 1700 3700
Wire Wire Line
	2050 3750 2150 3750
Connection ~ 2150 3750
Wire Wire Line
	2100 1700 2150 1700
Connection ~ 2150 1700
Wire Wire Line
	1800 1700 1750 1700
Wire Wire Line
	1750 1700 1750 1650
$Comp
L power:+12V #PWR0101
U 1 1 5CE82676
P 1750 1650
F 0 "#PWR0101" H 1750 1500 50  0001 C CNN
F 1 "+12V" H 1765 1823 50  0000 C CNN
F 2 "" H 1750 1650 50  0001 C CNN
F 3 "" H 1750 1650 50  0001 C CNN
	1    1750 1650
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR0102
U 1 1 5CE82DA9
P 1700 3700
F 0 "#PWR0102" H 1700 3550 50  0001 C CNN
F 1 "+12V" H 1715 3873 50  0000 C CNN
F 2 "" H 1700 3700 50  0001 C CNN
F 3 "" H 1700 3700 50  0001 C CNN
	1    1700 3700
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR0108
U 1 1 5CE836B8
P 2750 5650
F 0 "#PWR0108" H 2750 5500 50  0001 C CNN
F 1 "+12V" H 2765 5823 50  0000 C CNN
F 2 "" H 2750 5650 50  0001 C CNN
F 3 "" H 2750 5650 50  0001 C CNN
	1    2750 5650
	1    0    0    -1  
$EndComp
$Comp
L power:+12P #PWR0120
U 1 1 5CE84359
P 7500 2000
F 0 "#PWR0120" H 7500 1850 50  0001 C CNN
F 1 "+12P" H 7515 2173 50  0000 C CNN
F 2 "" H 7500 2000 50  0001 C CNN
F 3 "" H 7500 2000 50  0001 C CNN
	1    7500 2000
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR0134
U 1 1 5CEA9394
P 8550 1950
F 0 "#PWR0134" H 8550 1800 50  0001 C CNN
F 1 "+12V" H 8565 2123 50  0000 C CNN
F 2 "" H 8550 1950 50  0001 C CNN
F 3 "" H 8550 1950 50  0001 C CNN
	1    8550 1950
	1    0    0    -1  
$EndComp
Text Label 2550 3750 0    50   ~ 0
12L
Text Label 4000 3950 0    50   ~ 0
5LU
Text Label 4000 1900 0    50   ~ 0
5PU
Text Label 2550 1700 0    50   ~ 0
12P
$Comp
L Device:R R16
U 1 1 5CD8AF59
P 4350 1500
F 0 "R16" H 4420 1546 50  0000 L CNN
F 1 "0R" H 4420 1455 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 4280 1500 50  0001 C CNN
F 3 "~" H 4350 1500 50  0001 C CNN
	1    4350 1500
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R14
U 1 1 5CD8CF98
P 4000 1250
F 0 "R14" H 4070 1296 50  0000 L CNN
F 1 "0R" H 4070 1205 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 3930 1250 50  0001 C CNN
F 3 "~" H 4000 1250 50  0001 C CNN
	1    4000 1250
	1    0    0    -1  
$EndComp
$Comp
L Device:R R17
U 1 1 5CD8EF50
P 4400 3600
F 0 "R17" H 4470 3646 50  0000 L CNN
F 1 "0R" H 4470 3555 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 4330 3600 50  0001 C CNN
F 3 "~" H 4400 3600 50  0001 C CNN
	1    4400 3600
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R15
U 1 1 5CD8FEDE
P 4000 3400
F 0 "R15" H 4070 3446 50  0000 L CNN
F 1 "0R" H 4070 3355 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 3930 3400 50  0001 C CNN
F 3 "~" H 4000 3400 50  0001 C CNN
	1    4000 3400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0141
U 1 1 5CD904DA
P 4000 3150
F 0 "#PWR0141" H 4000 2900 50  0001 C CNN
F 1 "GND" H 4005 2977 50  0000 C CNN
F 2 "" H 4000 3150 50  0001 C CNN
F 3 "" H 4000 3150 50  0001 C CNN
	1    4000 3150
	-1   0    0    1   
$EndComp
Wire Wire Line
	4700 3600 4550 3600
Wire Wire Line
	4700 3600 4700 3950
Wire Wire Line
	4250 3600 4000 3600
Wire Wire Line
	4000 3600 4000 3750
Wire Wire Line
	4000 3600 4000 3550
Connection ~ 4000 3600
Wire Wire Line
	4000 3250 4000 3150
Wire Wire Line
	4500 1500 4700 1500
Wire Wire Line
	4700 1500 4700 1900
Wire Wire Line
	4200 1500 4000 1500
Wire Wire Line
	4000 1500 4000 1700
Wire Wire Line
	4000 1500 4000 1400
Connection ~ 4000 1500
$Comp
L power:GND #PWR0142
U 1 1 5CDA3735
P 4000 1000
F 0 "#PWR0142" H 4000 750 50  0001 C CNN
F 1 "GND" H 4005 827 50  0000 C CNN
F 2 "" H 4000 1000 50  0001 C CNN
F 3 "" H 4000 1000 50  0001 C CNN
	1    4000 1000
	-1   0    0    1   
$EndComp
Wire Wire Line
	4000 1100 4000 1000
$EndSCHEMATC
