@echo on
F:\Documents\Nircmd\nircmd.exe setdefaultsounddevice "Consoles" 1
F:\Documents\Nircmd\nircmd.exe mutesysvolume 1 default_record
F:\Documents\Nircmd\nircmd.exe setdefaultsounddevice "FiiO DAC-E10" 1
F:\Documents\Nircmd\nircmd.exe setdefaultsounddevice "FiiO DAC-E10" 2
F:\Documents\Nircmd\nircmd.exe setdefaultsounddevice "RODE Microphone" 1
F:\Documents\Nircmd\nircmd.exe setdefaultsounddevice "RODE Microphone" 2
F:\Documents\Nircmd\nircmd.exe setsysvolume 26214
F:\Documents\Nircmd\nircmd.exe loop 172800 500 setsysvolume 60292 default_record

:: This code ensures that my default audio devices are correct and it sets the volume to 40%. It also locks the default mic to 92%.
:: Created by Mitchell Thomas
