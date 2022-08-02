#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; a::
SoundBeep, 100, 100
Sleep, 16200000
; Sleep, 1000
Send {F5}
Sleep, 10000
Send ^{tab}
Sleep, 10000
Send {F5}
Sleep, 10000
MouseClick, left, 1413, 617
exit
return
