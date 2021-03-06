EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Wireless Vibration Sensor"
Date "2020-05-21"
Rev ""
Comp "CMHT"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L RF_Module:ESP32-WROOM-32D U3
U 1 1 5EA04A76
P 2650 3000
F 0 "U3" H 2200 4350 50  0000 C CNN
F 1 "ESP32-WROOM-32D" H 3150 4350 50  0000 C CNN
F 2 "RF_Module:ESP32-WROOM-32" H 2650 1500 50  0001 C CNN
F 3 "https://www.espressif.com/sites/default/files/documentation/esp32-wroom-32d_esp32-wroom-32u_datasheet_en.pdf" H 2350 3050 50  0001 C CNN
F 4 "1904-1023-2-ND" H 2650 3000 50  0001 C CNN "Digikey Part No."
	1    2650 3000
	1    0    0    -1  
$EndComp
Text GLabel 3350 2000 2    50   Input ~ 0
IO2
Wire Wire Line
	3250 2000 3350 2000
Text GLabel 3350 1800 2    50   Input ~ 0
IO0
Wire Wire Line
	3250 1800 3350 1800
$Comp
L Device:C_Small C2
U 1 1 5EC6B255
P 1750 2050
F 0 "C2" H 1842 2096 50  0000 L CNN
F 1 "1uF" H 1842 2005 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 1750 2050 50  0001 C CNN
F 3 "~" H 1750 2050 50  0001 C CNN
F 4 "1276-1066-2-ND" H 1750 2050 50  0001 C CNN "Digikey Part No."
	1    1750 2050
	1    0    0    -1  
$EndComp
Text GLabel 1250 1800 0    50   Input ~ 0
RESET
Wire Wire Line
	1250 1800 1450 1800
Wire Wire Line
	1750 1950 1750 1800
Connection ~ 1750 1800
Wire Wire Line
	1750 1800 1900 1800
Wire Wire Line
	1900 1800 1900 1600
Connection ~ 1900 1800
Wire Wire Line
	1900 1800 2050 1800
$Comp
L Device:R_Small R1
U 1 1 5EC6BF88
P 1900 1500
F 0 "R1" H 1959 1546 50  0000 L CNN
F 1 "10K" H 1959 1455 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 1900 1500 50  0001 C CNN
F 3 "~" H 1900 1500 50  0001 C CNN
F 4 "311-10KARTR-ND" H 1900 1500 50  0001 C CNN "Digikey Part No."
	1    1900 1500
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW1
U 1 1 5EC6D35B
P 1450 2150
F 0 "SW1" V 1496 2102 50  0000 R CNN
F 1 "RST" V 1405 2102 50  0000 R CNN
F 2 "Button_Switch_SMD:SW_SPST_CK_RS282G05A3" H 1450 2350 50  0001 C CNN
F 3 "~" H 1450 2350 50  0001 C CNN
F 4 "CKN10384TR-ND" H 1450 2150 50  0001 C CNN "Digikey Part No."
	1    1450 2150
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1450 1950 1450 1800
Connection ~ 1450 1800
Wire Wire Line
	1450 1800 1750 1800
Wire Wire Line
	1450 2350 1450 2500
$Comp
L power:GND #PWR0102
U 1 1 5EC6E5C5
P 1450 2500
F 0 "#PWR0102" H 1450 2250 50  0001 C CNN
F 1 "GND" H 1455 2327 50  0000 C CNN
F 2 "" H 1450 2500 50  0001 C CNN
F 3 "" H 1450 2500 50  0001 C CNN
	1    1450 2500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0103
U 1 1 5EC6EAA8
P 1750 2500
F 0 "#PWR0103" H 1750 2250 50  0001 C CNN
F 1 "GND" H 1755 2327 50  0000 C CNN
F 2 "" H 1750 2500 50  0001 C CNN
F 3 "" H 1750 2500 50  0001 C CNN
	1    1750 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	1750 2150 1750 2500
Wire Wire Line
	1900 1400 1900 1250
Wire Wire Line
	2650 1600 2650 1500
$Comp
L Connector_Generic:Conn_01x06 J2
U 1 1 5EC73B9B
P 2250 6350
F 0 "J2" H 2330 6342 50  0000 L CNN
F 1 "FTDI" H 2330 6251 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x06_P2.54mm_Vertical" H 2250 6350 50  0001 C CNN
F 3 "~" H 2250 6350 50  0001 C CNN
F 4 "2057-PH1-06-UA-ND" H 2250 6350 50  0001 C CNN "Digikey Part No."
	1    2250 6350
	1    0    0    -1  
$EndComp
Wire Wire Line
	1700 6400 1700 6450
Wire Wire Line
	1700 6450 2050 6450
$Comp
L power:GND #PWR0108
U 1 1 5EC75910
P 1950 6700
F 0 "#PWR0108" H 1950 6450 50  0001 C CNN
F 1 "GND" H 1955 6527 50  0000 C CNN
F 2 "" H 1950 6700 50  0001 C CNN
F 3 "" H 1950 6700 50  0001 C CNN
	1    1950 6700
	1    0    0    -1  
$EndComp
Wire Wire Line
	2050 6650 1950 6650
Wire Wire Line
	1950 6650 1950 6700
Wire Wire Line
	3250 2500 3350 2500
$Comp
L power:GND #PWR0110
U 1 1 5EC81ECB
P 2650 4450
F 0 "#PWR0110" H 2650 4200 50  0001 C CNN
F 1 "GND" H 2655 4277 50  0000 C CNN
F 2 "" H 2650 4450 50  0001 C CNN
F 3 "" H 2650 4450 50  0001 C CNN
	1    2650 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	2650 4400 2650 4450
$Comp
L Transistor_BJT:MBT2222ADW1T1 Q1
U 1 1 5EC829DB
P 3750 6150
F 0 "Q1" H 3941 6196 50  0000 L CNN
F 1 "MBT2222ADW1T1" H 3941 6105 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-363_SC-70-6" H 3950 6250 50  0001 C CNN
F 3 "http://www.onsemi.com/pub_link/Collateral/MBT2222ADW1T1-D.PDF" H 3750 6150 50  0001 C CNN
F 4 "MBT2222ADW1T1GOSTR-ND" H 3941 6059 50  0001 L CNN "Digikey Part No."
	1    3750 6150
	1    0    0    -1  
$EndComp
$Comp
L Transistor_BJT:MBT2222ADW1T1 Q1
U 2 1 5EC84C28
P 3750 6950
F 0 "Q1" H 3941 6904 50  0000 L CNN
F 1 "MBT2222ADW1T1" H 3941 6995 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-363_SC-70-6" H 3950 7050 50  0001 C CNN
F 3 "http://www.onsemi.com/pub_link/Collateral/MBT2222ADW1T1-D.PDF" H 3750 6950 50  0001 C CNN
F 4 "MBT2222ADW1T1GOSTR-ND" H 3750 6950 50  0001 C CNN "Digikey Part No."
	2    3750 6950
	1    0    0    1   
$EndComp
Wire Wire Line
	3850 5950 3850 5900
Wire Wire Line
	3850 5900 3900 5900
Wire Wire Line
	3550 6950 3400 6950
Text GLabel 3900 5900 2    50   Input ~ 0
IO0
$Comp
L Device:R_Small R4
U 1 1 5EC86167
P 3300 6150
F 0 "R4" V 3104 6150 50  0000 C CNN
F 1 "10K" V 3195 6150 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 3300 6150 50  0001 C CNN
F 3 "~" H 3300 6150 50  0001 C CNN
F 4 "311-10KARTR-ND" H 3300 6150 50  0001 C CNN "Digikey Part No."
	1    3300 6150
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R7
U 1 1 5EC867C6
P 3300 6950
F 0 "R7" V 3104 6950 50  0000 C CNN
F 1 "10K" V 3195 6950 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 3300 6950 50  0001 C CNN
F 3 "~" H 3300 6950 50  0001 C CNN
F 4 "311-10KARTR-ND" H 3300 6950 50  0001 C CNN "Digikey Part No."
	1    3300 6950
	0    1    1    0   
$EndComp
Text GLabel 3100 6050 1    50   Input ~ 0
RTS
Text GLabel 3100 7050 3    50   Input ~ 0
DTR
Text GLabel 3900 7200 2    50   Input ~ 0
RESET
Wire Wire Line
	3900 7200 3850 7200
Wire Wire Line
	3850 7200 3850 7150
Wire Wire Line
	3200 6950 3100 6950
Wire Wire Line
	3100 6950 3100 7050
Wire Wire Line
	3100 6950 3100 6700
Wire Wire Line
	3100 6700 3450 6700
Wire Wire Line
	3450 6700 3450 6400
Wire Wire Line
	3450 6400 3850 6400
Wire Wire Line
	3850 6400 3850 6350
Connection ~ 3100 6950
Wire Wire Line
	3100 6050 3100 6150
Wire Wire Line
	3100 6150 3200 6150
Wire Wire Line
	3400 6150 3550 6150
Wire Wire Line
	3100 6150 3100 6550
Wire Wire Line
	3100 6550 3850 6550
Wire Wire Line
	3850 6550 3850 6750
Connection ~ 3100 6150
Text GLabel 2050 6550 0    50   Input ~ 0
RTS
Text GLabel 2000 6150 0    50   Input ~ 0
DTR
Text GLabel 2000 6250 0    50   Input ~ 0
TXO
Text GLabel 2000 6350 0    50   Input ~ 0
RXI
Wire Wire Line
	2000 6350 2050 6350
Wire Wire Line
	2000 6250 2050 6250
Wire Wire Line
	2000 6150 2050 6150
Text GLabel 3350 1900 2    50   Input ~ 0
TXO
Text GLabel 3350 2100 2    50   Input ~ 0
RXI
Wire Wire Line
	3250 1900 3350 1900
Wire Wire Line
	3250 2100 3350 2100
Wire Wire Line
	3250 3300 3350 3300
Wire Wire Line
	3250 3200 3350 3200
$Comp
L Device:C_Small C1
U 1 1 5EC9C8E9
P 2950 1150
F 0 "C1" H 3042 1196 50  0000 L CNN
F 1 "10uF" H 3042 1105 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2950 1150 50  0001 C CNN
F 3 "~" H 2950 1150 50  0001 C CNN
F 4 "490-10516-2-ND" H 2950 1150 50  0001 C CNN "Digikey Part No."
	1    2950 1150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0112
U 1 1 5EC9D148
P 2950 1300
F 0 "#PWR0112" H 2950 1050 50  0001 C CNN
F 1 "GND" H 2955 1127 50  0000 C CNN
F 2 "" H 2950 1300 50  0001 C CNN
F 3 "" H 2950 1300 50  0001 C CNN
	1    2950 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2950 1300 2950 1250
Wire Wire Line
	2950 1050 2950 1000
$Comp
L Device:R_Small R5
U 1 1 5ECB41B2
P 5000 6300
F 0 "R5" H 5059 6346 50  0000 L CNN
F 1 "1K" H 5059 6255 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 5000 6300 50  0001 C CNN
F 3 "~" H 5000 6300 50  0001 C CNN
F 4 "311-1KARTR-ND" H 5000 6300 50  0001 C CNN "Digikey Part No."
	1    5000 6300
	1    0    0    -1  
$EndComp
Text GLabel 4900 6500 0    50   Input ~ 0
IO0
Wire Wire Line
	4900 6500 5000 6500
Wire Wire Line
	5000 6500 5000 6400
Wire Wire Line
	5000 6200 5000 6100
$Comp
L Switch:SW_Push SW2
U 1 1 5ECBC13F
P 5000 6700
F 0 "SW2" V 5046 6652 50  0000 R CNN
F 1 "RST" V 4955 6652 50  0000 R CNN
F 2 "Button_Switch_SMD:SW_SPST_CK_RS282G05A3" H 5000 6900 50  0001 C CNN
F 3 "~" H 5000 6900 50  0001 C CNN
F 4 "CKN10384TR-ND" H 5000 6700 50  0001 C CNN "Digikey Part No."
	1    5000 6700
	0    -1   -1   0   
$EndComp
Connection ~ 5000 6500
$Comp
L power:GND #PWR0116
U 1 1 5ECBD0CB
P 5000 6950
F 0 "#PWR0116" H 5000 6700 50  0001 C CNN
F 1 "GND" H 5005 6777 50  0000 C CNN
F 2 "" H 5000 6950 50  0001 C CNN
F 3 "" H 5000 6950 50  0001 C CNN
	1    5000 6950
	1    0    0    -1  
$EndComp
Wire Wire Line
	5000 6950 5000 6900
Wire Wire Line
	3250 2200 3350 2200
Text GLabel 3350 2300 2    50   Input ~ 0
CLK
Wire Wire Line
	3250 3400 3350 3400
Wire Wire Line
	3250 3100 3350 3100
Wire Wire Line
	3250 3000 3350 3000
Wire Wire Line
	3250 2300 3350 2300
Wire Wire Line
	3250 2800 3350 2800
Wire Wire Line
	3250 2900 3350 2900
Wire Wire Line
	3250 2700 3350 2700
Wire Wire Line
	3250 2600 3350 2600
Wire Wire Line
	3250 2400 3350 2400
Text GLabel 3350 4100 2    50   Input ~ 0
EXIO1
Wire Wire Line
	3250 4000 3350 4000
Wire Wire Line
	3250 4100 3350 4100
$Comp
L Device:CP1_Small C7
U 1 1 5EDB6D15
P 3400 1150
F 0 "C7" H 3491 1196 50  0000 L CNN
F 1 "100uF" H 3491 1105 50  0000 L CNN
F 2 "Capacitor_SMD:CP_Elec_6.3x4.5" H 3400 1150 50  0001 C CNN
F 3 "~" H 3400 1150 50  0001 C CNN
F 4 "399-6726-2-ND" H 3400 1150 50  0001 C CNN "Digikey Part No."
	1    3400 1150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0141
U 1 1 5EDB920E
P 3400 1300
F 0 "#PWR0141" H 3400 1050 50  0001 C CNN
F 1 "GND" H 3405 1127 50  0000 C CNN
F 2 "" H 3400 1300 50  0001 C CNN
F 3 "" H 3400 1300 50  0001 C CNN
	1    3400 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	3400 1300 3400 1250
Wire Wire Line
	3400 1050 3400 1000
Wire Wire Line
	3250 3600 3350 3600
Wire Wire Line
	3250 3700 3350 3700
$Comp
L Mechanical:MountingHole_Pad H2
U 1 1 5EDD6568
P 9650 6300
F 0 "H2" H 9750 6349 50  0000 L CNN
F 1 "Mount" H 9750 6258 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.5mm_Pad" H 9650 6300 50  0001 C CNN
F 3 "~" H 9650 6300 50  0001 C CNN
	1    9650 6300
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole_Pad H3
U 1 1 5EDD6E05
P 10200 6300
F 0 "H3" H 10300 6349 50  0000 L CNN
F 1 "Mount" H 10300 6258 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.5mm_Pad" H 10200 6300 50  0001 C CNN
F 3 "~" H 10200 6300 50  0001 C CNN
	1    10200 6300
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole_Pad H4
U 1 1 5EDD6F94
P 10700 6300
F 0 "H4" H 10800 6349 50  0000 L CNN
F 1 "Mount" H 10800 6258 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.5mm_Pad" H 10700 6300 50  0001 C CNN
F 3 "~" H 10700 6300 50  0001 C CNN
	1    10700 6300
	1    0    0    -1  
$EndComp
Wire Notes Line
	4100 500  4100 4800
Wire Notes Line
	7150 2400 7150 500 
Wire Notes Line
	9400 2400 9400 500 
Wire Notes Line
	4100 2400 11150 2400
Wire Notes Line
	7600 4800 7600 2400
Wire Notes Line
	500  4800 7600 4800
Wire Notes Line
	5950 7750 5950 4800
Text Notes 1000 750  0    118  ~ 24
ESP32
Text Notes 650  5050 0    79   ~ 16
Power + Programming
Wire Wire Line
	3250 3500 3750 3500
Wire Wire Line
	3750 3500 3750 3400
$Comp
L Device:R_Small R2
U 1 1 5FDAE8CF
P 8850 3650
F 0 "R2" H 8880 3670 50  0000 L CNN
F 1 "10K" H 8880 3610 50  0001 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 8850 3650 60  0001 C CNN
F 3 "" H 8850 3650 60  0000 C CNN
F 4 "311-10KARTR-ND" H 8850 3650 60  0001 C CNN "Digikey Part No."
	1    8850 3650
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0101
U 1 1 5FDAE8D5
P 9400 3850
F 0 "#PWR0101" H 9400 3600 50  0001 C CNN
F 1 "GND" H 9400 3700 50  0000 C CNN
F 2 "" H 9400 3850 60  0000 C CNN
F 3 "" H 9400 3850 60  0000 C CNN
	1    9400 3850
	1    0    0    -1  
$EndComp
Text GLabel 8350 3550 0    60   Input ~ 0
SP0CTRL
$Comp
L Device:Q_NMOS_GDS Q2
U 1 1 5FDAE8DD
P 9300 3550
F 0 "Q2" H 9505 3596 50  0000 L CNN
F 1 "IRLZ44N" H 9505 3505 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:TO-263-2" H 9500 3650 50  0001 C CNN
F 3 "~" H 9300 3550 50  0001 C CNN
F 4 "IRLZ44NSTRLPBFTR-ND" H 9300 3550 50  0001 C CNN "Digikey Part No."
	1    9300 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	9400 3750 9400 3800
Wire Wire Line
	8600 3550 8850 3550
Connection ~ 8850 3550
Wire Wire Line
	8850 3550 9100 3550
Wire Wire Line
	9400 3800 8850 3800
Wire Wire Line
	8850 3800 8850 3750
Connection ~ 9400 3800
Wire Wire Line
	9400 3800 9400 3850
Wire Wire Line
	9400 2900 9400 3350
$Comp
L pspice:DIODE D2
U 1 1 5FDAE8F3
P 10000 3500
F 0 "D2" H 10000 3765 50  0000 C CNN
F 1 "1N4001" H 10000 3674 50  0000 C CNN
F 2 "Diode_THT:D_DO-41_SOD81_P7.62mm_Horizontal" H 10000 3500 50  0001 C CNN
F 3 "" H 10000 3500 50  0001 C CNN
F 4 "1N4001-TPMSCT-ND" H 10000 3500 50  0001 C CNN "Digikey Part No."
	1    10000 3500
	0    1    1    0   
$EndComp
Wire Wire Line
	10000 3250 10000 3300
Wire Wire Line
	10000 3700 10000 3750
Text Notes 8700 2750 0    79   Italic 16
Spin Motor
Text GLabel 10000 3750 3    60   Input ~ 0
M+
Text GLabel 9400 2900 0    60   Input ~ 0
M+
$Comp
L AP2112k:AP2112K-3.3V U1
U 1 1 5FDE960C
P 10000 5300
F 0 "U1" H 9750 5500 40  0000 C CNN
F 1 "SPX3819-3.3V" H 10100 5500 40  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23-5" H 10000 5400 35  0000 C CIN
F 3 "" H 10000 5300 60  0000 C CNN
F 4 "1016-1873-1-ND" H 10000 5300 60  0001 C CNN "Digikey Part No."
	1    10000 5300
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C3
U 1 1 5FDE9613
P 9100 5500
F 0 "C3" H 9000 5600 50  0000 L CNN
F 1 "1uF" H 9110 5420 50  0001 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 9100 5500 60  0001 C CNN
F 3 "" H 9100 5500 60  0000 C CNN
F 4 "1276-1066-2-ND" H 9100 5500 60  0001 C CNN "Digikey Part No."
	1    9100 5500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0104
U 1 1 5FDE9619
P 10000 5750
F 0 "#PWR0104" H 10000 5500 50  0001 C CNN
F 1 "GND" H 10000 5600 50  0000 C CNN
F 2 "" H 10000 5750 60  0000 C CNN
F 3 "" H 10000 5750 60  0000 C CNN
	1    10000 5750
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0105
U 1 1 5FDE961F
P 10600 5150
F 0 "#PWR0105" H 10600 5000 50  0001 C CNN
F 1 "+3.3V" H 10600 5290 50  0000 C CNN
F 2 "" H 10600 5150 60  0000 C CNN
F 3 "" H 10600 5150 60  0000 C CNN
	1    10600 5150
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C4
U 1 1 5FDE9626
P 10750 5500
F 0 "C4" H 10760 5570 50  0000 L CNN
F 1 "2.2uF" H 10760 5420 50  0001 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 10750 5500 60  0001 C CNN
F 3 "" H 10750 5500 60  0000 C CNN
F 4 "311-1870-2-ND" H 10750 5500 60  0001 C CNN "Digikey Part No."
	1    10750 5500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0106
U 1 1 5FDE962C
P 10750 5700
F 0 "#PWR0106" H 10750 5450 50  0001 C CNN
F 1 "GND" H 10750 5550 50  0000 C CNN
F 2 "" H 10750 5700 60  0000 C CNN
F 3 "" H 10750 5700 60  0000 C CNN
	1    10750 5700
	1    0    0    -1  
$EndComp
Wire Wire Line
	9550 5400 9450 5400
Wire Wire Line
	9100 5400 9100 5250
Connection ~ 9100 5250
Wire Wire Line
	10000 5600 10000 5650
Wire Wire Line
	9100 5600 9100 5650
Wire Wire Line
	9100 5650 10000 5650
Connection ~ 10000 5650
Wire Wire Line
	10450 5250 10600 5250
Wire Wire Line
	10750 5250 10750 5400
Wire Wire Line
	10750 5700 10750 5600
Wire Wire Line
	10600 5250 10600 5150
Connection ~ 10600 5250
Wire Wire Line
	10000 5650 10000 5750
Wire Wire Line
	8950 5250 9100 5250
Wire Wire Line
	10600 5250 10750 5250
Text GLabel 9450 5400 0    60   Input ~ 0
3VEN
Wire Wire Line
	8950 5250 8950 5100
Text Notes 9500 4800 0    79   Italic 16
3.3V Regulator
$Comp
L Device:D_Schottky D5
U 1 1 5FDE9650
P 8950 4950
F 0 "D5" H 8800 5000 50  0000 C CNN
F 1 "MBR230L" H 8950 4850 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-123F" H 8950 4950 60  0001 C CNN
F 3 "" H 8950 4950 60  0000 C CNN
F 4 "MBR230LSFT1GOSCT-ND" H 8950 4950 60  0001 C CNN "Digikey Part No."
	1    8950 4950
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8950 4700 8950 4800
$Comp
L Connector_Generic:Conn_01x03 J3
U 1 1 5FDEEFFD
P 8450 1400
F 0 "J3" H 8530 1442 50  0000 L CNN
F 1 "Hall_Conn" H 8530 1351 50  0000 L CNN
F 2 "Connector_JST:JST_PH_B3B-PH-K_1x03_P2.00mm_Vertical" H 8450 1400 50  0001 C CNN
F 3 "~" H 8450 1400 50  0001 C CNN
F 4 "455-1705-ND" H 8450 1400 50  0001 C CNN "Digikey Part No."
	1    8450 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	8250 1300 8100 1300
Wire Wire Line
	8100 1300 8100 1200
Wire Wire Line
	8250 1400 8000 1400
Wire Wire Line
	8250 1500 8100 1500
Wire Wire Line
	8100 1500 8100 1650
$Comp
L power:GND #PWR0107
U 1 1 5FDFEBB0
P 8100 1650
F 0 "#PWR0107" H 8100 1400 50  0001 C CNN
F 1 "GND" H 8100 1500 50  0000 C CNN
F 2 "" H 8100 1650 60  0000 C CNN
F 3 "" H 8100 1650 60  0000 C CNN
	1    8100 1650
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0111
U 1 1 5FDFF64D
P 8100 1200
F 0 "#PWR0111" H 8100 1050 50  0001 C CNN
F 1 "+3.3V" H 8100 1340 50  0000 C CNN
F 2 "" H 8100 1200 60  0000 C CNN
F 3 "" H 8100 1200 60  0000 C CNN
	1    8100 1200
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0113
U 1 1 5FDFFE80
P 1900 1250
F 0 "#PWR0113" H 1900 1100 50  0001 C CNN
F 1 "+3.3V" H 1900 1390 50  0000 C CNN
F 2 "" H 1900 1250 60  0000 C CNN
F 3 "" H 1900 1250 60  0000 C CNN
	1    1900 1250
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0114
U 1 1 5FE00731
P 2950 1000
F 0 "#PWR0114" H 2950 850 50  0001 C CNN
F 1 "+3.3V" H 2950 1140 50  0000 C CNN
F 2 "" H 2950 1000 60  0000 C CNN
F 3 "" H 2950 1000 60  0000 C CNN
	1    2950 1000
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0115
U 1 1 5FE00BD7
P 3400 1000
F 0 "#PWR0115" H 3400 850 50  0001 C CNN
F 1 "+3.3V" H 3400 1140 50  0000 C CNN
F 2 "" H 3400 1000 60  0000 C CNN
F 3 "" H 3400 1000 60  0000 C CNN
	1    3400 1000
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0117
U 1 1 5FE00F99
P 5000 6100
F 0 "#PWR0117" H 5000 5950 50  0001 C CNN
F 1 "+3.3V" H 5000 6240 50  0000 C CNN
F 2 "" H 5000 6100 60  0000 C CNN
F 3 "" H 5000 6100 60  0000 C CNN
	1    5000 6100
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0121
U 1 1 5FE02628
P 1700 6400
F 0 "#PWR0121" H 1700 6250 50  0001 C CNN
F 1 "+3.3V" H 1700 6540 50  0000 C CNN
F 2 "" H 1700 6400 60  0000 C CNN
F 3 "" H 1700 6400 60  0000 C CNN
	1    1700 6400
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0122
U 1 1 5FE032B0
P 8950 4700
F 0 "#PWR0122" H 8950 4550 50  0001 C CNN
F 1 "+5V" H 8965 4873 50  0000 C CNN
F 2 "" H 8950 4700 50  0001 C CNN
F 3 "" H 8950 4700 50  0001 C CNN
	1    8950 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	8650 5300 8650 5250
Wire Wire Line
	8650 5650 8650 5600
Wire Wire Line
	8600 5650 8650 5650
Text GLabel 8600 5650 0    60   Input ~ 0
3VEN
$Comp
L Device:R R6
U 1 1 5FDE9660
P 8650 5450
F 0 "R6" V 8730 5450 50  0000 C CNN
F 1 "100k" V 8650 5450 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 8580 5450 30  0001 C CNN
F 3 "" H 8650 5450 30  0000 C CNN
F 4 "‎311-100KCRCT-ND‎ " V 8650 5450 60  0001 C CNN "Digikey Part No."
	1    8650 5450
	-1   0    0    1   
$EndComp
$Comp
L power:+5V #PWR0123
U 1 1 5FE04033
P 10000 3250
F 0 "#PWR0123" H 10000 3100 50  0001 C CNN
F 1 "+5V" H 10015 3423 50  0000 C CNN
F 2 "" H 10000 3250 50  0001 C CNN
F 3 "" H 10000 3250 50  0001 C CNN
	1    10000 3250
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x05 J4
U 1 1 5FE110CE
P 7050 3650
F 0 "J4" H 7130 3692 50  0000 L CNN
F 1 "LED_CONN" H 7130 3601 50  0000 L CNN
F 2 "Connector_JST:JST_PH_B5B-PH-K_1x05_P2.00mm_Vertical" H 7050 3650 50  0001 C CNN
F 3 "~" H 7050 3650 50  0001 C CNN
F 4 "455-1707-ND" H 7050 3650 50  0001 C CNN "Digikey Part No."
	1    7050 3650
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0124
U 1 1 5FE1232A
P 6750 3350
F 0 "#PWR0124" H 6750 3200 50  0001 C CNN
F 1 "+5V" H 6765 3523 50  0000 C CNN
F 2 "" H 6750 3350 50  0001 C CNN
F 3 "" H 6750 3350 50  0001 C CNN
	1    6750 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	6850 3450 6750 3450
Wire Wire Line
	6750 3450 6750 3350
$Comp
L LED:APA102-2020 D4
U 1 1 5FE17C83
P 5000 4050
F 0 "D4" H 5150 4300 50  0000 C CNN
F 1 "APA102-2020" H 4650 3800 50  0000 C CNN
F 2 "project_footprints:LED-APA102-2020_no_center" H 5050 3750 50  0001 L TNN
F 3 "http://www.led-color.com/upload/201604/APA102-2020%20SMD%20LED.pdf" H 5100 3675 50  0001 L TNN
F 4 "1528-1826-ND" H 5000 4050 50  0001 C CNN "Digikey Part No."
	1    5000 4050
	1    0    0    -1  
$EndComp
Text GLabel 6750 3550 0    50   Input ~ 0
SDI_STRAND
Text GLabel 6750 3650 0    50   Input ~ 0
CKI_STRAND
Wire Wire Line
	6750 3550 6850 3550
Wire Wire Line
	6750 3650 6850 3650
Text GLabel 5350 3950 2    50   Input ~ 0
SDI_STRAND
Text GLabel 5350 4050 2    50   Input ~ 0
CKI_STRAND
Wire Wire Line
	5300 3950 5350 3950
Wire Wire Line
	5300 4050 5350 4050
$Comp
L power:+5V #PWR0125
U 1 1 5FE2F3AC
P 4600 3150
F 0 "#PWR0125" H 4600 3000 50  0001 C CNN
F 1 "+5V" H 4615 3323 50  0000 C CNN
F 2 "" H 4600 3150 50  0001 C CNN
F 3 "" H 4600 3150 50  0001 C CNN
	1    4600 3150
	1    0    0    -1  
$EndComp
$Comp
L Device:D D3
U 1 1 5FE318A2
P 4850 3300
F 0 "D3" H 4850 3084 50  0000 C CNN
F 1 "1N4001" H 4850 3175 50  0000 C CNN
F 2 "Diode_THT:D_DO-41_SOD81_P7.62mm_Horizontal" H 4850 3300 50  0001 C CNN
F 3 "~" H 4850 3300 50  0001 C CNN
F 4 "1N4001-TPMSCT-ND" H 4850 3300 50  0001 C CNN "Digikey Part No."
	1    4850 3300
	-1   0    0    1   
$EndComp
Text GLabel 4650 3950 0    50   Input ~ 0
SDI
Text GLabel 4650 4050 0    50   Input ~ 0
CKI
Wire Wire Line
	4650 3950 4700 3950
Wire Wire Line
	4650 4050 4700 4050
$Comp
L power:GND #PWR0126
U 1 1 5FE48D06
P 5000 4400
F 0 "#PWR0126" H 5000 4150 50  0001 C CNN
F 1 "GND" H 5005 4227 50  0000 C CNN
F 2 "" H 5000 4400 50  0001 C CNN
F 3 "" H 5000 4400 50  0001 C CNN
	1    5000 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	5000 4350 5000 4400
Text GLabel 3350 3000 2    50   Input ~ 0
SDI
Text GLabel 3350 3100 2    50   Input ~ 0
CKI
$Comp
L Device:Jumper_NO_Small JP3
U 1 1 5FE5D89D
P 5450 2750
F 0 "JP3" H 5450 2650 50  0000 C CNN
F 1 "SDI_JMP" H 5450 2844 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 5450 2750 50  0001 C CNN
F 3 "~" H 5450 2750 50  0001 C CNN
	1    5450 2750
	1    0    0    -1  
$EndComp
$Comp
L Device:Jumper_NO_Small JP4
U 1 1 5FE5DF39
P 5450 3050
F 0 "JP4" H 5450 2950 50  0000 C CNN
F 1 "CKI_JMP" H 5450 3144 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 5450 3050 50  0001 C CNN
F 3 "~" H 5450 3050 50  0001 C CNN
	1    5450 3050
	1    0    0    -1  
$EndComp
Text GLabel 5250 2750 0    50   Input ~ 0
SDI
Text GLabel 5250 3050 0    50   Input ~ 0
CKI
Text GLabel 5650 2750 2    50   Input ~ 0
SDI_STRAND
Text GLabel 5650 3050 2    50   Input ~ 0
CKI_STRAND
Wire Wire Line
	5250 2750 5350 2750
Wire Wire Line
	5250 3050 5350 3050
Wire Wire Line
	5550 3050 5650 3050
Wire Wire Line
	5550 2750 5650 2750
$Comp
L power:GND #PWR0127
U 1 1 5FE776D3
P 6750 3950
F 0 "#PWR0127" H 6750 3700 50  0001 C CNN
F 1 "GND" H 6755 3777 50  0000 C CNN
F 2 "" H 6750 3950 50  0001 C CNN
F 3 "" H 6750 3950 50  0001 C CNN
	1    6750 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	6850 3850 6750 3850
Wire Wire Line
	6750 3850 6750 3950
Wire Wire Line
	6850 3750 6750 3750
Wire Wire Line
	6750 3750 6750 3850
Connection ~ 6750 3850
$Comp
L Device:C_Small C5
U 1 1 5FEA177E
P 5300 3450
F 0 "C5" H 5310 3520 50  0000 L CNN
F 1 "2.2uF" H 5310 3370 50  0001 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 5300 3450 60  0001 C CNN
F 3 "" H 5300 3450 60  0000 C CNN
F 4 "311-1870-2-ND" H 5300 3450 60  0001 C CNN "Digikey Part No."
	1    5300 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	5000 3300 5000 3750
$Comp
L power:GND #PWR0109
U 1 1 5FEFEF47
P 5300 3600
F 0 "#PWR0109" H 5300 3350 50  0001 C CNN
F 1 "GND" H 5305 3427 50  0000 C CNN
F 2 "" H 5300 3600 50  0001 C CNN
F 3 "" H 5300 3600 50  0001 C CNN
	1    5300 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	5000 3300 5300 3300
Wire Wire Line
	5300 3300 5300 3350
Connection ~ 5000 3300
Wire Wire Line
	4700 3300 4600 3300
Wire Wire Line
	4600 3300 4600 3150
Wire Wire Line
	5300 3550 5300 3600
Wire Wire Line
	9100 5250 9550 5250
$Comp
L Connector:Screw_Terminal_01x02 J1
U 1 1 5FDA4D26
P 7900 5300
F 0 "J1" H 7818 4975 50  0000 C CNN
F 1 "power" H 7818 5066 50  0000 C CNN
F 2 "TerminalBlock_Phoenix:TerminalBlock_Phoenix_MKDS-3-2-5.08_1x02_P5.08mm_Horizontal" H 7900 5300 50  0001 C CNN
F 3 "~" H 7900 5300 50  0001 C CNN
	1    7900 5300
	-1   0    0    1   
$EndComp
$Comp
L power:+5V #PWR0119
U 1 1 5FDA6CCB
P 8200 5150
F 0 "#PWR0119" H 8200 5000 50  0001 C CNN
F 1 "+5V" H 8215 5323 50  0000 C CNN
F 2 "" H 8200 5150 50  0001 C CNN
F 3 "" H 8200 5150 50  0001 C CNN
	1    8200 5150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0120
U 1 1 5FDA7136
P 8200 5350
F 0 "#PWR0120" H 8200 5100 50  0001 C CNN
F 1 "GND" H 8200 5200 50  0000 C CNN
F 2 "" H 8200 5350 60  0000 C CNN
F 3 "" H 8200 5350 60  0000 C CNN
	1    8200 5350
	1    0    0    -1  
$EndComp
Wire Wire Line
	8100 5200 8200 5200
Wire Wire Line
	8200 5200 8200 5150
Wire Wire Line
	8100 5300 8200 5300
Wire Wire Line
	8200 5300 8200 5350
$Comp
L Motor:Motor_DC M1
U 1 1 5FDC9AD6
P 10650 3450
F 0 "M1" H 10808 3446 50  0000 L CNN
F 1 "Motor_DC" H 10808 3355 50  0000 L CNN
F 2 "project_footprints:Microgeared_motor_pololu" H 10650 3360 50  0001 C CNN
F 3 "~" H 10650 3360 50  0001 C CNN
	1    10650 3450
	1    0    0    -1  
$EndComp
Text GLabel 10650 3900 3    60   Input ~ 0
M+
$Comp
L power:+5V #PWR0128
U 1 1 5FDCAD4B
P 10650 3100
F 0 "#PWR0128" H 10650 2950 50  0001 C CNN
F 1 "+5V" H 10665 3273 50  0000 C CNN
F 2 "" H 10650 3100 50  0001 C CNN
F 3 "" H 10650 3100 50  0001 C CNN
	1    10650 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	8650 5250 8950 5250
Connection ~ 8950 5250
$Comp
L power:+3.3V #PWR0118
U 1 1 5FDE630B
P 3750 3400
F 0 "#PWR0118" H 3750 3250 50  0001 C CNN
F 1 "+3.3V" H 3750 3540 50  0000 C CNN
F 2 "" H 3750 3400 60  0000 C CNN
F 3 "" H 3750 3400 60  0000 C CNN
	1    3750 3400
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0129
U 1 1 5FDEC223
P 2650 1500
F 0 "#PWR0129" H 2650 1350 50  0001 C CNN
F 1 "+3.3V" H 2650 1640 50  0000 C CNN
F 2 "" H 2650 1500 60  0000 C CNN
F 3 "" H 2650 1500 60  0000 C CNN
	1    2650 1500
	1    0    0    -1  
$EndComp
$Comp
L Device:Jumper_NO_Small JP1
U 1 1 5FD948FB
P 8500 3550
F 0 "JP1" H 8500 3450 50  0000 C CNN
F 1 "CTRL_JMP" H 8500 3644 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 8500 3550 50  0001 C CNN
F 3 "~" H 8500 3550 50  0001 C CNN
	1    8500 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	8350 3550 8400 3550
Text GLabel 8000 1400 0    50   Input ~ 0
hall
$Comp
L Device:C_Small C6
U 1 1 5FDB148B
P 10400 3500
F 0 "C6" H 10410 3570 50  0000 L CNN
F 1 "100pF" H 10410 3420 50  0001 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 10400 3500 60  0001 C CNN
F 3 "" H 10400 3500 60  0000 C CNN
F 4 "311-1870-2-ND" H 10400 3500 60  0001 C CNN "Digikey Part No."
	1    10400 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	10650 3100 10650 3150
Wire Wire Line
	10650 3750 10650 3800
Wire Wire Line
	10650 3150 10400 3150
Wire Wire Line
	10400 3150 10400 3400
Connection ~ 10650 3150
Wire Wire Line
	10650 3150 10650 3250
Wire Wire Line
	10400 3600 10400 3800
Wire Wire Line
	10400 3800 10650 3800
Connection ~ 10650 3800
Wire Wire Line
	10650 3800 10650 3900
Text GLabel 3350 3700 2    50   Input ~ 0
hall
Text GLabel 3350 2200 2    60   Input ~ 0
SP0CTRL
$EndSCHEMATC
