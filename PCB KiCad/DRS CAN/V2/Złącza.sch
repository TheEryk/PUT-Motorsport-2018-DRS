EESchema Schematic File Version 4
LIBS:DRS-cache
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 3
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
L power:GND #PWR?
U 1 1 5CDFDA2B
P 9500 1800
AR Path="/5CDFDA2B" Ref="#PWR?"  Part="1" 
AR Path="/5CD9263B/5CDFDA2B" Ref="#PWR0136"  Part="1" 
F 0 "#PWR0136" H 9500 1550 50  0001 C CNN
F 1 "GND" V 9505 1672 50  0000 R CNN
F 2 "" H 9500 1800 50  0001 C CNN
F 3 "" H 9500 1800 50  0001 C CNN
	1    9500 1800
	0    -1   -1   0   
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5CDFDA31
P 9500 1600
AR Path="/5CDFDA31" Ref="#PWR?"  Part="1" 
AR Path="/5CD9263B/5CDFDA31" Ref="#PWR0138"  Part="1" 
F 0 "#PWR0138" H 9500 1450 50  0001 C CNN
F 1 "+5V" V 9515 1728 50  0000 L CNN
F 2 "" H 9500 1600 50  0001 C CNN
F 3 "" H 9500 1600 50  0001 C CNN
	1    9500 1600
	0    1    1    0   
$EndComp
Wire Wire Line
	9300 1600 9500 1600
Wire Wire Line
	9300 1800 9500 1800
$Comp
L Connector_Generic:Conn_02x03_Odd_Even J?
U 1 1 5CDFDA3F
P 9000 1700
AR Path="/5CDFDA3F" Ref="J?"  Part="1" 
AR Path="/5CD9263B/5CDFDA3F" Ref="J3"  Part="1" 
F 0 "J3" H 9050 2017 50  0000 C CNN
F 1 "Conn_02x03_Odd_Even" H 9050 1926 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x03_P2.54mm_Vertical" H 9000 1700 50  0001 C CNN
F 3 "~" H 9000 1700 50  0001 C CNN
	1    9000 1700
	1    0    0    -1  
$EndComp
Text HLabel 8800 1800 0    50   Input ~ 0
RESET
Text HLabel 8800 1700 0    50   Input ~ 0
SCK
Text HLabel 8800 1600 0    50   Input ~ 0
MISO
Text HLabel 9300 1700 2    50   Input ~ 0
MOSI
$Comp
L power:+12P #PWR0121
U 1 1 5CE85E27
P 8700 2050
F 0 "#PWR0121" H 8700 1900 50  0001 C CNN
F 1 "+12P" H 8715 2223 50  0000 C CNN
F 2 "" H 8700 2050 50  0001 C CNN
F 3 "" H 8700 2050 50  0001 C CNN
	1    8700 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	8700 2050 8700 2100
Wire Wire Line
	8700 2100 8800 2100
Text HLabel 8800 2300 0    50   Input ~ 0
CANH
Text HLabel 8800 2200 0    50   Input ~ 0
CANL
$Comp
L power:GND #PWR0122
U 1 1 5CE866BA
P 8750 2450
F 0 "#PWR0122" H 8750 2200 50  0001 C CNN
F 1 "GND" H 8755 2277 50  0000 C CNN
F 2 "" H 8750 2450 50  0001 C CNN
F 3 "" H 8750 2450 50  0001 C CNN
	1    8750 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	8750 2450 8750 2400
Wire Wire Line
	8750 2400 8800 2400
$Comp
L Connector:Screw_Terminal_01x03 J2
U 1 1 5CE87B95
P 9000 3100
F 0 "J2" H 9080 3142 50  0000 L CNN
F 1 "Screw_Terminal_01x03" H 9080 3051 50  0000 L CNN
F 2 "TerminalBlock_RND:TerminalBlock_RND_205-00013_1x03_P5.00mm_Horizontal" H 9000 3100 50  0001 C CNN
F 3 "~" H 9000 3100 50  0001 C CNN
	1    9000 3100
	1    0    0    -1  
$EndComp
$Comp
L Connector:Screw_Terminal_01x03 J4
U 1 1 5CE88842
P 9100 3850
F 0 "J4" H 9180 3892 50  0000 L CNN
F 1 "Screw_Terminal_01x03" H 9180 3801 50  0000 L CNN
F 2 "TerminalBlock_RND:TerminalBlock_RND_205-00013_1x03_P5.00mm_Horizontal" H 9100 3850 50  0001 C CNN
F 3 "~" H 9100 3850 50  0001 C CNN
	1    9100 3850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0129
U 1 1 5CE88F0A
P 8500 3250
F 0 "#PWR0129" H 8500 3000 50  0001 C CNN
F 1 "GND" H 8505 3077 50  0000 C CNN
F 2 "" H 8500 3250 50  0001 C CNN
F 3 "" H 8500 3250 50  0001 C CNN
	1    8500 3250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0131
U 1 1 5CE891A9
P 8500 4000
F 0 "#PWR0131" H 8500 3750 50  0001 C CNN
F 1 "GND" H 8505 3827 50  0000 C CNN
F 2 "" H 8500 4000 50  0001 C CNN
F 3 "" H 8500 4000 50  0001 C CNN
	1    8500 4000
	1    0    0    -1  
$EndComp
$Comp
L power:+5VL #PWR0135
U 1 1 5CE8962C
P 8500 2950
F 0 "#PWR0135" H 8500 2800 50  0001 C CNN
F 1 "+5VL" H 8515 3123 50  0000 C CNN
F 2 "" H 8500 2950 50  0001 C CNN
F 3 "" H 8500 2950 50  0001 C CNN
	1    8500 2950
	1    0    0    -1  
$EndComp
$Comp
L power:+5VP #PWR0139
U 1 1 5CE8AF65
P 8500 3800
F 0 "#PWR0139" H 8500 3650 50  0001 C CNN
F 1 "+5VP" H 8515 3973 50  0000 C CNN
F 2 "" H 8500 3800 50  0001 C CNN
F 3 "" H 8500 3800 50  0001 C CNN
	1    8500 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	8500 4000 8500 3950
Wire Wire Line
	8500 3950 8900 3950
Wire Wire Line
	8500 3800 8500 3850
Wire Wire Line
	8500 3850 8900 3850
Wire Wire Line
	8500 3250 8500 3200
Wire Wire Line
	8500 3200 8800 3200
Wire Wire Line
	8500 2950 8500 3100
Wire Wire Line
	8500 3100 8800 3100
Text HLabel 8800 3000 0    50   Input ~ 0
PWM1
Text HLabel 8900 3750 0    50   Input ~ 0
PWM2
$Comp
L Connector:Screw_Terminal_01x04 J1
U 1 1 5CE8FDF0
P 9000 2200
F 0 "J1" H 9080 2192 50  0000 L CNN
F 1 "Screw_Terminal_01x04" H 9080 2101 50  0000 L CNN
F 2 "TerminalBlock_RND:TerminalBlock_RND_205-00014_1x04_P5.00mm_Horizontal" H 9000 2200 50  0001 C CNN
F 3 "~" H 9000 2200 50  0001 C CNN
	1    9000 2200
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H1
U 1 1 5CF37E64
P 7100 1500
F 0 "H1" H 7200 1546 50  0000 L CNN
F 1 "MountingHole" H 7200 1455 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 7100 1500 50  0001 C CNN
F 3 "~" H 7100 1500 50  0001 C CNN
	1    7100 1500
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H2
U 1 1 5CF381D7
P 7100 1750
F 0 "H2" H 7200 1796 50  0000 L CNN
F 1 "MountingHole" H 7200 1705 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 7100 1750 50  0001 C CNN
F 3 "~" H 7100 1750 50  0001 C CNN
	1    7100 1750
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H3
U 1 1 5CF383C8
P 7100 2000
F 0 "H3" H 7200 2046 50  0000 L CNN
F 1 "MountingHole" H 7200 1955 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 7100 2000 50  0001 C CNN
F 3 "~" H 7100 2000 50  0001 C CNN
	1    7100 2000
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H4
U 1 1 5CF38813
P 7100 2250
F 0 "H4" H 7200 2296 50  0000 L CNN
F 1 "MountingHole" H 7200 2205 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 7100 2250 50  0001 C CNN
F 3 "~" H 7100 2250 50  0001 C CNN
	1    7100 2250
	1    0    0    -1  
$EndComp
$EndSCHEMATC
