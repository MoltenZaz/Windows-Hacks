Menu, Tray, Icon, DDORes.dll, 4
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance force
; IfWinExist ahk_exe g2mui.exe
; {
Loop
{
;run "F:\Documents\AHK Current\Nircmd\SoundVolumeView.exe" /SetVolume "RODE Microphone" 97
SoundSet, 95, Master, Volume, 9
sleep 1000
}
; }