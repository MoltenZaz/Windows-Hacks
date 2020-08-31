Menu, Tray, Icon, networkexplorer.dll, 15

#InputLevel 1
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#MaxHotkeysPerInterval, 100000000000
#SingleInstance Force

Run Symbol Layer.ahk ; I use this script to run the symbol layer so that it works with the dvorak layout

FirstTime = 1
FirstTimeD = 0
dvorak = 1
LSpace = 0
RSpace = 0

; If you click or press any key in a fullscreen application it will change to QWERTY and will change to DVORAK when you click and you're not in a fullscreen application

; ───────────────────── AUTO SWAP ─────────────────────

~LButton::GoSub, Swap
~RButton::GoSub, Swap
~Space::GoSub, Swap
~Enter::GoSub, Swap
~a::GoSub, Swap

Swap:
{
	isFullScreen := isWindowFullScreen( "A" )
	If(isFullScreen = 1)
	{
		If(FirstTime = 1 and dvorak = 1)
		{
			FirstTime := 0
			FirstTimeD := 1
			dvorak := 0			
			; return
		}
		else
		{
			; return
		}
	}
	else
	{
		If(FirstTimeD = 1 and dvorak = 0)
		{
			FirstTime := 1
			FirstTimeD := 0
			dvorak := 1
			; return
		}
		else
		{
			; return
		}
	}
	; Input, var, L1 V
	; GoSub, Swap
	; SetTimer, SwapTimer, 1000
	return
}

; SwapTimer:
; {
	; SetTimer, SwapTimer, Off
	; Input, var, L1 V
	; GoSub, Swap
	; return
; }
; ─────────────────────────────────────────────────────

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

^Insert::Send {Insert}

; ──────────────────────────────────────────── Space Cadet Shift With {} ────────────────────────────────────────────

#If dvorak = 1
{
	~LShift::
	{
		LS := 1
		SetTimer, LTimer, 150
		; KeyWait, LShift
		return
	}

	~LShift Up::
	{
		If(LS = 1 and A_PriorKey = "LShift")
		{
			Send (
		}
		return
	}

	~>+LShift::
	{
		LS := 1
		SetTimer, LTimer, 150
		; KeyWait, LShift
		return
	}

	~>+LShift Up::
	{
		If(LS = 1 and A_PriorKey = "LShift")
		{
			SendRaw, {
		}
		return
	}

	~RShift::
	{
		RS := 1
		SetTimer, RTimer, 150
		; KeyWait, RShift
		return
	}

	~RShift Up::
	{
		If(RS = 1 and A_PriorKey = "RShift")
		{
			Send )
		}
		return
	}

	~<+RShift::
	{
		RS := 1
		SetTimer, RTimer, 150
		; KeyWait, RShift
		return
	}

	~<+RShift Up::
	{
		If(RS = 1 and A_PriorKey = "RShift")
		{
			SendRaw, }
		}
		return
	}

	LTimer:
	{
		SetTimer, LTimer, Off
		; SoundBeep, 500, 100
		LS := 0
		return
	}

	RTimer:
	{
		SetTimer, RTimer, Off
		; SoundBeep, 500, 100
		RS := 0
		return
	}
}
#If

; ─────────────────────────────────────────────────────────────────────────────────────────────────────────────────

;┌────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐
;│                                                                                                                │
;│	If Control alt LWin RWin and F13 aren't being pressed while dvorak is set to 1 then remap to dvorak       │
;│  F13 is used to detect modifiers in the FireFox Keyboard script, so it is unnessasary if you aren't using it.  │
;│                                                                                                                │
;└────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘

CapsLock::Backspace
!Backspace::CapsLock

#If !GetKeyState("Control") and !GetKeyState("Alt") and !GetKeyState("LWin") and !GetKeyState("RWin") and dvorak = 1 and !GetKeyState("F13")
{
	; QWERTY to Dvorak mapping
	
	$-::[
	$=::]

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
