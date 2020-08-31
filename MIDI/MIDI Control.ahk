Menu, Tray, Icon, imageres.dll, 18
#include Midi.ahk
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% 

midi := new Midi()
midi.OpenMidiIn( 1 )

Return

; MidiControlChange1:
	; cc := midi.MidiIn()
	; ccValue := cc.value
	; MsgBox You set the mod wheel to %ccValue%
	; Return
	
; MidiNoteOnC3:
; {
	; If C3 = 1
	; {
		; C3 := 0
	; }
	; else
	; {
		; Run, Calc.exe
		; C3:=1
	; }
; Return
; }
MidiProgramChange0:
{
	Program := 0
	return
}

MidiProgramChange1:
{
	Program := 1
	return
}

MidiControlChange:
{
	If sus = 1
	{
		sus := 0
	}
	else
	{
		sus := 1
	}
	If sus = 0
	{
		SendInput, {F14 Up}
	}
	; If Program = 1
	{
	If sus = 1
	{
		SendInput, {F14 Down}
	}
	}
	return
}
