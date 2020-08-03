Menu, Tray, Icon, networkexplorer.dll, 15

#InputLevel 1
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#MaxHotkeysPerInterval, 10000
#SingleInstance Force

Run Symbol Layer.ahk

FirstTime = 1
FirstTimeD = 0
dvorak = 1
LSpace = 0
RSpace = 0

~LButton::
{
	isFullScreen := isWindowFullScreen( "A" )
	If(isFullScreen = 1)
	{
		If(FirstTime = 1 and dvorak = 1)
		{
			FirstTime := 0
			FirstTimeD := 1
			GoSub Insert
			return
		}
		else
		{
			return
		}
	}
	else
	{
		If(FirstTimeD = 1 and dvorak = 0)
		{
			FirstTime := 1
			FirstTimeD := 0
			GoSub Insert
			return
		}
		else
		{
			return
		}
		return
	}
	return
}

Insert::
If(dvorak = 1)
{
	SoundBeep, 300, 150
	SoundBeep, 300, 150
	dvorak := 0
}
else
{
	SoundBeep, 300, 50
	SoundBeep, 300, 50
	SoundBeep, 300, 50
	dvorak := 1
}
return

; ~!Insert::
; SetTimer, Refresh, 60001
; return

; Refresh:
; {
; Reload
; return
; }

#If dvorak = 1
{
	; ; Space Cadet Shift with {} when both are pressed.

	; ~RShift::
	; {
	; KeyWait, RShift
	; If (A_TimeSinceThisHotkey < 150 and A_PriorKey = "RShift")
	; {
		; SendRaw, )
	; }
	; Return
	; }

	; ~LShift::
	; {
	; KeyWait, LShift
	; If (A_TimeSinceThisHotkey < 150 and A_PriorKey = "LShift")
	; {
		; SendRaw, (
	; }
	; Return
	; }
	
	; >+LShift::
	; {
	; KeyWait, LShift
	; If (A_TimeSinceThisHotkey < 150 and A_PriorKey = "LShift")
	; {
		; SendRaw, {
	; }
	; return
	; }
	
	; <+RShift::
	; {
	; KeyWait, RShift
	; If (A_TimeSinceThisHotkey < 150 and A_PriorKey = "RShift")
	; {
		; SendRaw, }
	; }
	; return
	; }
}
#if

;┌—————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————┐
;│																																   │
;│	If Control alt LWin RWin and F13 aren't being pressed while dvorak is set to 1 then remap to dvorak with space cadet shifts.   │
;│  F13 is used to detect modifiers in the FireFox Keyboard script, so it is unnessasary if you aren't using it.                   │
;│																																   │
;└—————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————┘

#If !GetKeyState("Control") and !GetKeyState("Alt") and !GetKeyState("LWin") and !GetKeyState("RWin") and dvorak = 1 and !GetKeyState("F13")
{
	; QWERTY to Dvorak mapping
	
	$-::{
	$=::}
	$+-::Send [
	$+=::Send ]

	q::'
	w::,
	e::.
	r::p
	t::y
	y::f
	u::g
	i::c
	o::r
	p::l
	[::/
	]::=

	;a::a
	s::o
	d::e
	f::u
	g::i
	h::d
	j::h
	k::t
	l::n
	`;::s
	'::-

	z::`;
	x::q
	c::j
	v::k
	b::x
	n::b
	;m::m
	,::w
	.::v
	/::z
}
#if

; ──────────────────────────────────────────── FULLSCREEN CHECKER ────────────────────────────────────────────

isFullScreen := isWindowFullScreen( "A" )
;MsgBox % isFullScreen ? "Full Screen" : "Windowed"
isWindowFullScreen( winTitle )
{
	;checks if the specified window is full screen
	
	winID := WinExist( winTitle )

	If ( !winID )
		Return false

	WinGet style, Style, ahk_id %WinID%
	WinGetPos ,,,winW,winH, %winTitle%
	; 0x800000 is WS_BORDER.
	; 0x20000000 is WS_MINIMIZE.
	; no border and not minimized
	Return ((style & 0x20800000) or winH < A_ScreenHeight or winW < A_ScreenWidth) ? false : true
}

; ────────────────────────────────────────────────────────────────────────────────────────────────────────────
