; Configurat; Configuration file for Duet WiFi / Ethernet
; executed by the firmware on start-up

; General preferences
M111 S0 						                                      ; Debugging off
G21 							                                        ; Work in millimetres
G90 							                                        ; Send absolute coordinates...
M83 							                                        ; ...but relative extruder moves
M555 P2 						                                      ; Set firmware compatibility to look like Marlin

; Network
M550 P"ToolChanger" 					                            ; Set machine name
M552 S1							                                      ; Enable Networking
;M587 S"ssid" P"password"				                           ; WiFi Settings
M586 P0 S1 						                                    ; Enable HTTP
M586 P1 S0 						                                    ; Disable FTP
M586 P2 S0 						                                    ; Disable Telnet

M669 K1                                        						; Select CoreXY mode	

; Drive direction
M569 P0 S0 						; Drive 0 X
M569 P1 S0 						; Drive 1 Y
M569 P2 S1 						; Drive 2 Z
M569 P3 S0 						; Drive 3 E0
M569 P4 S0 						; Drive 4 E1
M569 P5 S1 						; Drive 5 E2
M569 P6 S1 						; Drive 6 E3
M569 P7 S0 						; Drive 7 COUPLER
M569 P8 S0 						; Drive 8 UNUSED
M569 P9 S0 						; Drive 9 UNUSED

M584 X0 Y1 Z2 U7 E3:4:5:6 				                      ; Apply custom drive mapping
M208 X-35:328.5 Y-49:243 Z0:300 C0:500 S0 		          ; Set axis maxima & minima
M350 E8:8:8:8 U8 I0 					                          ; Configure microstepping without interpolation
M350 X16 Y16 Z16 I1					                            ; Configure microstepping with interpolation
M92 X100 Y100 Z1600 U100 E417:417:417:417		            ; Set steps per mm
M566 X400 Y400 Z8 U2 E2:2:2:2				                    ; Set maximum instantaneous speed changes (mm/min)
M203 X35000 Y35000 Z1200 U5000 E5000:5000:5000:5000	    ; Set maximum speeds (mm/min)
M201 X6000 Y6000 Z400 U500 E2500:2500:2500:2500		      ; Set accelerations (mm/s^2)
M906 X2000 Y2000 Z1330 U400 E1680:1680:1680:1680 I30 	  ; Set motor currents (mA) and motor idle factor in percent
M84 S120 												                        ; Set idle timeout

; Thermal Sensors
M308 S0 P"bedtemp" Y"thermistor" T100000 B4138         	; Set thermistor + ADC parameters for heater 0
M308 S1 P"e0temp" Y"thermistor" T100000 B4388        	  ; Set thermistor + ADC parameters for heater 1
M308 S2 P"e1temp" Y"thermistor" T100000 B4388          	; Set thermistor + ADC parameters for heater 2
M308 S3 P"e2temp" Y"thermistor" T100000 B4388         	; Set thermistor + ADC parameters for heater 3
M308 S4 P"e3temp" Y"thermistor" T100000 B4388         	; Set thermistor + ADC parameters for heater 4

; Hardware
M950 H0 C"bedheat" T0
M950 H1 C"e0heat" T1
M950 H2 C"e1heat" T2
M950 H3 C"duex.e2heat" T3
M950 H4 C"duex.e3heat" T4
M950 F1 C"fan1"
M950 F2 C"fan2"
M950 F3 C"duex.fan3"
M950 F4 C"duex.fan4"
M950 F5 C"duex.fan5"
M950 F6 C"duex.fan6"
M950 F7 C"duex.fan7"
M950 F8 C"duex.fan8"

; Heaters Max Temp Protection
M143 H0 S225 						; Set temperature limit for heater 0 to 225C
M143 H1 S300 						; Set temperature limit for heater 1 to 300C
M143 H2 S300 						; Set temperature limit for heater 2 to 300C
M143 H3 S300 						; Set temperature limit for heater 3 to 300C
M143 H4 S300 						; Set temperature limit for heater 4 to 300C


; Fanmapping
M106 P2 S0 I0 F500 H-1 C"Tool 0"               ; Set fan 2 value, PWM signal inversion and frequency. Thermostatic control is turned off
M106 P4 S0 I0 F500 H-1 C"Tool 1"               ; Set fan 4 value, PWM signal inversion and frequency. Thermostatic control is turned off
M106 P6 S0 I0 F500 H-1 C"Tool 2"               ; Set fan 6 value, PWM signal inversion and frequency. Thermostatic control is turned off
M106 P8 S0 I0 F500 H-1 C"Tool 3"               ; Set fan 8 value, PWM signal inversion and frequency. Thermostatic control is turned off

M106 P1 S1 I0 F500 H1 T70                      ; Set fan 1 value for Tool 0, PWM signal inversion and frequency. Thermostatic control is turned on
M106 P3 S1 I0 F500 H2 T70                      ; Set fan 3 value for Tool 1, PWM signal inversion and frequency. Thermostatic control is turned on
M106 P5 S1 I0 F500 H3 T70                      ; Set fan 5 value for Tool 2, PWM signal inversion and frequency. Thermostatic control is turned on
M106 P7 S1 I0 F500 H4 T70                      ; Set fan 7 value for Tool 4, PWM signal inversion and frequency. Thermostatic control is turned on

; Endstops
M574 X1 Y1 S3 				                    ; Set X / Y endstop stall detection
M558 P7 X0 Y0 Z2 H3 F360 I0 T20000 			  ; Set Z probe type to switch, the axes for which it is used and the dive height + speeds
G31 P200 X0 Y0 Z0	 				                ; Set Z probe trigger value, offset and trigger height
M557 X10:290 Y20:180 S40 				          ; Define mesh grid

;Stall Detection
M915 U S5 F0 H200               					; Coupler
M915 X Y S5 F0 H400       			          ; X / Y Axes

; Z-Probe
M574 Z0 C"nil" 		                       ; no Z endstop switch, free up Z endstop input
M558 P5 C"!zstop" H3 F360 T20000	       ; Z probe connected to Z endstop input
G31 P200 X0 Y0 Z0	 				               ; Set Z probe trigger value, offset and trigger height
M557 X10:290 Y20:180 S40 				         ; Define mesh grid

; Tools
M563 P0 D0 H1 F2                                ; Define tool 0, Fan 0
G10 P0 X0 Y0 Z0 					                      ; Reset tool 0 axis offsets
G10 P0 R0 S0 						                        ; Reset initial tool 0 active and standby temperatures to 0C

M563 P1 D1 H2 F4                                ; Define tool 1, Fan 3
G10 P1 X0 Y0 Z0 					                      ; Reset tool 1 axis offsets
G10 P1 R0 S0 						                        ; Reset initial tool 1 active and standby temperatures to 0C

M563 P2 D2 H3 F6                                ; Define tool 2, Fan 7
G10 P2 X0 Y0 Z0 					                      ; Reset tool 2 axis offsets
G10 P2 R0 S0 						                        ; Reset initial tool 2 active and standby temperatures to 0C
  
M563 P3 D3 H4 F8                                ; Define tool 3, Fan 5
G10 P3 X0 Y0 Z0 					                      ; Reset tool 3 axis offsets
G10 P3 R0 S0 						                        ; Reset initial tool 3 active and standby temperatures to 0C


; Advanced
M593 F50						                             ; cancel ringing at 50Hz (https://forum.e3d-online.com/threads/accelerometer-and-resonance-measurements-of-the-motion-system.3445/)
;M376 H15						                             ; bed compensation taper

;tool offsets
G10 P0 X-9 Y39 Z-5					; T0
G10 P1 X-9 Y39 Z-5					; T1
G10 P2 X-9 Y39 Z-5					; T2
G10 P3 X-9 Y39 Z-5					; T3

;deselect tools
T-1

;M572 D0 S0.2 						; pressure advance T0
;M572 D1 S0.2 						; pressure advance T1
;M572 D2 S0.2 						; pressure advance T2
;M572 D3 S0.2 						; pressure advance T3

; Load config override
M501
