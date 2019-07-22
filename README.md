# RepRapFirmware SD
The standard configuration files for the Motion System &amp; ToolChanger.

Copy onto the Micro SD Card and insert into the Duet2 before power on.

You may need to check the config.g file to make changes for use on your own Network.

It is also recommended that you disable Run free macro, Run pre macro and Run post macro in Settings > User Interface inside of Duet Web Control. This will only stop the automatic tool changes when using the UI and not when printing. Issuing T0 etc into the G-Code Console will still initiate tool changes.

https://duet3d.dozuki.com/c/RepRapFirmware

https://duet3d.dozuki.com/Wiki/Gcode

Firmware Version:	2.04RC1 (2019-07-14b1)
Web Interface Version:	1.22.6