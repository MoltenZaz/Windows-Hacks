#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; run F:\Documents\Nircmd\nircmd.exe setdefaultsounddevice "Consoles" 1
; run F:\Documents\Nircmd\nircmd.exe mutesysvolume 1 default_record
run F:\Documents\Nircmd\nircmd.exe setdefaultsounddevice "FiiO DAC-E10" 1
run F:\Documents\Nircmd\nircmd.exe setdefaultsounddevice "FiiO DAC-E10" 2
run F:\Documents\Nircmd\nircmd.exe setdefaultsounddevice "RODE Microphone" 1
run F:\Documents\Nircmd\nircmd.exe setdefaultsounddevice "RODE Microphone" 2
SoundSet, 40, Master, Volume
; SoundSet, 95, Master, Volume, 10
; SoundSet, 1, Master, Mute, 9

run "F:\Documents\AHK Current\Nircmd\SoundVolumeView.exe" /SetVolume "RODE Microphone" 97
run "F:\Documents\AHK Current\Nircmd\SoundVolumeView.exe" /Mute "Consoles"
run "F:\Documents\AHK Current\Nircmd\SoundVolumeView.exe" /SetVolume "Consoles" 0
Sleep, 10000
run "F:\Documents\AHK Current\Nircmd\SoundVolumeView.exe" /Mute "Consoles"
run "F:\Documents\AHK Current\Nircmd\SoundVolumeView.exe" /SetVolume "Consoles" 0