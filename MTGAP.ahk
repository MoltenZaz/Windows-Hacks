Menu, Tray, Icon, networkexplorer.dll, 15

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Use insert to swap keyboard layouts
; and do not let Control, Alt, or Win modifiers act on mtgap
TargetScriptTitle := "Firefox Keyboard - WD.ahk ahk_class AutoHotkey"
mtgap = 1
;Run autohotkey.exe "F:\Documents\AHK Current\Firefox Keyboard - WD.ahk" %mtgap%

Insert::
{
If(mtgap = 1)
{
	mtgap := 0
	;SetTimer, QLed, 10
	; SoundBeep, 300, 150
	; SoundBeep, 300, 150
}
else
{
	mtgap := 1
	;SetTimer, MLed, 10
	; SoundBeep, 300, 50
	; SoundBeep, 300, 50
	; SoundBeep, 300, 50
}
return
}

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

MLed:
{
	SetTimer, MLed, off
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

;~!Insert::
;suspend, off
;SetTimer, Refresh, 60000
;return

;Refresh:
;{
;Reload
;return
;}

; {
	; ;Send, {Insert}
	; mtgap := 0
	; SoundBeep, 300, 150
	; SoundBeep, 300, 150
	; Suspend
	; return
; }

; ^Insert::
; {
	; mtgap := 1
	; SoundBeep, 300, 50
	; SoundBeep, 300, 50
	; SoundBeep, 300, 50
	; return
; }

; QWERTY to mtgap mapping
#If mtgap = 1 and !GetKeyState("Control") and !GetKeyState("Alt") and !GetKeyState("LWin") and !GetKeyState("RWin")
{
-::[
=::]

q::y
w::p
e::o
r::u
t::j
y::k
u::d
i::l
o::c
p::w
;[::/
;]::=

a::i
s::n
d::e
f::a
g::.
h::m
j::h
k::t
l::s
`;::r
'::/

z::q
x::z
c::'
v::,
b::`;
n::b
m::f
,::g
.::v
/::x
}
#if

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