Menu, Tray, Icon, morse-code.ico
#SingleInstance force
#MaxHotkeysPerInterval 1000
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; set default speed to 10 wpm
; UNIT := 120
IniRead, UNIT, Morse.ini, Morse, Speed
If (UNIT == "ERROR")
{
	UNIT := 120
	IniWrite, %UNIT%, Morse.ini, Morse, Speed
}
SUNIT := UNIT * 3
SLUNIT := UNIT * 4

; enable or disable formatting
; FormattingEnabled := 1
IniRead, FormattingEnabled, Morse.ini, Morse, FormattingEnabled
If (FormattingEnabled == "ERROR")
{
	FormattingEnabled := 1
	IniWrite, %FormattingEnabled%, Morse.ini, Morse, FormattingEnabled
}

; enable or disable sound
IniRead, Sound, Morse.ini, Morse, SoundEnabled
If (Sound == "ERROR")
{
	Sound := 1
	IniWrite, %Sound%, Morse.ini, Morse, SoundEnabled
}
return

; dots
F14::
{
	ST := 0
	While GetKeyState("F14","P")
	{
		If (FormattingEnabled == 1)
			Send, {. Down}
		else
			Send, {Space Down}
		if (Sound == 1)
			SoundBeep, 600, %UNIT%
		else
			Sleep, UNIT
		If (FormattingEnabled == 1)
			Send, {. Up}
		else
			Send, {Space Up}
		Sleep, UNIT
	}
	If (FormattingEnabled == 1)
	{
		If !GetKeyState("F23","P")
		{
			ST := 1
			SUNIT := UNIT * 3
			SetTimer, SpaceTimer, %SUNIT%
		}
	}
}
Return

; dashes
F23::
{
	ST := 0
	SUNIT := UNIT * 3
	While GetKeyState("F23","P")
	{
		If (FormattingEnabled == 1)
			Send, {- Down}
		else
			Send, {Space Down}
		if (Sound == 1)
			SoundBeep, 600, %SUNIT%
		else
			Sleep, UNIT * 3
		If (FormattingEnabled == 1)
			Send, {- Up}
		else
			Send, {Space Up}
		Sleep, UNIT
	}
	If (FormattingEnabled == 1)
	{	
		If !GetKeyState("F14","P")
		{
			ST := 1
			SUNIT := UNIT * 3
			SetTimer, SpaceTimer, %SUNIT%
		}
	}
}
Return

; space for inbetween letters
SpaceTimer:
{
	if (ST == 1)
	{
		Send, {Space}
		SetTimer, SpaceTimer, off
		SLUNIT := UNIT * 4
		SetTimer, SlashTimer, %SLUNIT%
		return
	}
	SetTimer, SpaceTimer, off
	return
}

; slash for inbetween words
SlashTimer:
{
	if (ST == 1)
	{
		Send, /{Space}
		SetTimer, SlashTimer, off
		ST := 0
		return
	}
	SetTimer, SlashTimer, off
	return
}

; toggle formatting
~^+F1::
{
	If (FormattingEnabled == 1)
		FormattingEnabled := 0
	else
		FormattingEnabled := 1
	IniWrite, FormattingEnabled, Morse.ini, Morse, FormattingEnabled
}
return

; toggle sound
~^+F2::
{
	If (Sound == 1)
		Sound := 0
	else
		Sound := 1
	IniWrite, Sound, Morse.ini, Morse, SoundEnabled/ 
}
return

; set speed of morse code
; 5wpm
~^F1::
{
	UNIT:=240
	IniWrite, %UNIT%, Morse.ini, Morse, Speed
}
return

; 10wpm
~^F2::
{
	UNIT:=120
	IniWrite, %UNIT%, Morse.ini, Morse, Speed
}
return

; 15wpm
~^F3::
{
	UNIT:=80
	IniWrite, %UNIT%, Morse.ini, Morse, Speed
}
return

; 20wpm
~^F4::
{
	UNIT:=60
	IniWrite, %UNIT%, Morse.ini, Morse, Speed
}
return

; 25wpm
~^F5::
{
	UNIT:=48
	IniWrite, %UNIT%, Morse.ini, Morse, Speed
}
return

; 30wpm
~^F6::
{
	UNIT:=40
	IniWrite, %UNIT%, Morse.ini, Morse, Speed
}
return

; 35wpm
~^F7::
{
	UNIT:=34.28571
	IniWrite, %UNIT%, Morse.ini, Morse, Speed
}
return

; 40wpm
~^F8::
{
	UNIT:=30
	IniWrite, %UNIT%, Morse.ini, Morse, Speed
}
return

; 45wpm
~^F9::
{
	UNIT:=26.66667
	IniWrite, %UNIT%, Morse.ini, Morse, Speed
}
return

; 50wpm
~^F10::
{
	UNIT:=24
	IniWrite, %UNIT%, Morse.ini, Morse, Speed
}
return

; 55wpm
~^F11::UNIT:=21.81818
{
	UNIT:=21.81818
	IniWrite, %UNIT%, Morse.ini, Morse, Speed
}
return

; 60wpm
~^F12::
{
	UNIT:=20
	IniWrite, %UNIT%, Morse.ini, Morse, Speed
}
return
