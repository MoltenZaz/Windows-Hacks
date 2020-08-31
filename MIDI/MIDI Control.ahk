Menu, Tray, Icon, imageres.dll, 18
#include Midi.ahk
#NoEnv
SendMode Input
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

MidiControlChange64Vel0:
{
SendInput, {F14 Up}
return
}

MidiControlChange64Vel127:
{
SendInput, {F14 Down}
return
}

MidiControlChange66Vel0:
{
SendInput, {F14 Up}
return
}

MidiControlChange66Vel127:
{
SendInput, {F14 Down}
return
}

MidiControlChange67Vel0:
{
SendInput, {F14 Up}
return
}

MidiControlChange67Vel127:
{
SendInput, {F14 Down}
return
}