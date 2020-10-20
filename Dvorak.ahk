Menu, Tray, Icon, networkexplorer.dll, 15

#InputLevel 1
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn   Enable warnings to assist with detecting common errors.
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
return
; If you click or press any key in a fullscreen application it will change to QWERTY and will change to DVORAK when you click and you're not in a fullscreen application

; ───────────────────── AUTO SWAP ─────────────────────

~LButton::GoSub, Swap
~RButton::GoSub, Swap
; ~Space::GoSub, Swap
; ~Enter::GoSub, Swap
; ~a::GoSub, Swap

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
			SetTimer, QLed, 10			
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
			dvorak := 1
			SetTimer, DLed, 10
			return
		}
		else
		{
			return
		}
	}
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
QLed:
{
	SetTimer, QLed, off
	KeyboardLED(7,"on", 2)
	Sleep, 200
	KeyboardLED(7,"off", 2)
	Sleep, 100
	KeyboardLED(7,"on", 2)
	Sleep, 200
	KeyboardLED(7,"off", 2)
	Sleep, 100
	return
}

DLed:
{
	SetTimer, DLed, off
	KeyboardLED(7,"on", 2)
	Sleep, 100
	KeyboardLED(7,"off", 2)
	Sleep, 100
	KeyboardLED(7,"on", 2)
	Sleep, 100
	KeyboardLED(7,"off", 2)
	Sleep, 100
	KeyboardLED(7,"on", 2)
	Sleep, 100
	KeyboardLED(7,"off", 2)
	return
}

Insert::
{
If(dvorak = 1)
{
	dvorak := 0
	SetTimer, QLed, 10
	; SoundBeep, 300, 150
	; SoundBeep, 300, 150
}
else
{
	dvorak := 1
	SetTimer, DLed, 10
	; SoundBeep, 300, 50
	; SoundBeep, 300, 50
	; SoundBeep, 300, 50
}
return
}

^Insert::Send {Insert}

; ──────────────────────────────────────────── Space Cadet Shift With {} ────────────────────────────────────────────
; This is so close to working but theres something screwy going on that idk how to fix and it seems to conflict with firefox keyboard

; #If dvorak = 1
; {
	; ~LShift::
	; {
		; LS := 1
		; If GetKeyState("LShift")
		; SetTimer, LTimer, 150
		; KeyWait, LShift
		; return
	; }

	; ~LShift Up::
	; {
		; If(LS = 1 and A_PriorKey = "LShift")
		; {
			; Send (
		; }
		; return
	; }

	; ~>+LShift::
	; {
		; LS := 1
		; RS := 0
		; SetTimer, LTimer, 150
		; KeyWait, LShift
		; return
	; }

	; ~>+LShift Up::
	; {
		; If(LS = 1 and A_PriorKey = "LShift")
		; {
			; SendRaw, {
		; }
		; return
	; }

	; ~RShift::
	; {
		; RS := 1
		; SetTimer, RTimer, 150
		; KeyWait, RShift
		; return
	; }

	; ~RShift Up::
	; {
		; If(RS = 1 and A_PriorKey = "RShift")
		; {
			; Send )
		; }
		; return
	; }

	; ~<+RShift::
	; {
		; RS := 1
		; LS := 0
		; SetTimer, RTimer, 150
		; KeyWait, RShift
		; return
	; }

	; ~<+RShift Up::
	; {
		; If(RS = 1 and A_PriorKey = "RShift")
		; {
			; SendRaw, }
		; }
		; return
	; }
	
	; LTimer:
	; {
		; SetTimer, LTimer, Off
		; ; SoundBeep, 500, 100
		; LS := 0
		; return
	; }

	; RTimer:
	; {
		; SetTimer, RTimer, Off
		; ; SoundBeep, 500, 100
		; RS := 0
		; return
	; }
; }
; #If

; ─────────────────────────────────────────────────────────────────────────────────────────────────────────────────

;┌────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐
;│                                                                                                                │
;│	If Control alt LWin RWin and F13 aren't being pressed while dvorak is set to 1 then remap to dvorak           │
;│  F13 is used to detect modifiers in the FireFox Keyboard script, so it is unnessasary if you aren't using it.  │
;│                                                                                                                │
;└────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘

CapsLock::Backspace
#CapsLock::CapsLock

#If dvorak = 1 and !GetKeyState("Control") and !GetKeyState("Alt") and !GetKeyState("LWin") and !GetKeyState("RWin") and !GetKeyState("F13")
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

KeyboardLED(LEDvalue, Cmd, Kbd=0)
{
  SetUnicodeStr(fn,"\Device\KeyBoardClass" Kbd)
  h_device:=NtCreateFile(fn,0+0x00000100+0x00000080+0x00100000,1,1,0x00000040+0x00000020,0)
  
  If Cmd= switch  ;switches every LED according to LEDvalue
   KeyLED:= LEDvalue
  If Cmd= on  ;forces all choosen LED's to ON (LEDvalue= 0 ->LED's according to keystate)
   KeyLED:= LEDvalue | (GetKeyState("ScrollLock", "T") + 2*GetKeyState("NumLock", "T") + 4*GetKeyState("CapsLock", "T"))
  If Cmd= off  ;forces all choosen LED's to OFF (LEDvalue= 0 ->LED's according to keystate)
    {
    LEDvalue:= LEDvalue ^ 7
    KeyLED:= LEDvalue & (GetKeyState("ScrollLock", "T") + 2*GetKeyState("NumLock", "T") + 4*GetKeyState("CapsLock", "T"))
    }
  
  success := DllCall( "DeviceIoControl"
              ,  "ptr", h_device
              , "uint", CTL_CODE( 0x0000000b     ; FILE_DEVICE_KEYBOARD
                        , 2
                        , 0             ; METHOD_BUFFERED
                        , 0  )          ; FILE_ANY_ACCESS
              , "int*", KeyLED << 16
              , "uint", 4
              ,  "ptr", 0
              , "uint", 0
              ,  "ptr*", output_actual
              ,  "ptr", 0 )
  
  NtCloseFile(h_device)
  return success
}

CTL_CODE( p_device_type, p_function, p_method, p_access )
{
  Return, ( p_device_type << 16 ) | ( p_access << 14 ) | ( p_function << 2 ) | p_method
}


NtCreateFile(ByRef wfilename,desiredaccess,sharemode,createdist,flags,fattribs)
{
  VarSetCapacity(objattrib,6*A_PtrSize,0)
  VarSetCapacity(io,2*A_PtrSize,0)
  VarSetCapacity(pus,2*A_PtrSize)
  DllCall("ntdll\RtlInitUnicodeString","ptr",&pus,"ptr",&wfilename)
  NumPut(6*A_PtrSize,objattrib,0)
  NumPut(&pus,objattrib,2*A_PtrSize)
  status:=DllCall("ntdll\ZwCreateFile","ptr*",fh,"UInt",desiredaccess,"ptr",&objattrib
                  ,"ptr",&io,"ptr",0,"UInt",fattribs,"UInt",sharemode,"UInt",createdist
                  ,"UInt",flags,"ptr",0,"UInt",0, "UInt")
  return % fh
}

NtCloseFile(handle)
{
  return DllCall("ntdll\ZwClose","ptr",handle)
}


SetUnicodeStr(ByRef out, str_)
{
  VarSetCapacity(out,2*StrPut(str_,"utf-16"))
  StrPut(str_,&out,"utf-16")
}
