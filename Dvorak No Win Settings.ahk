Menu, Tray, Icon, networkexplorer.dll, 15

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#MaxHotkeysPerInterval, 10000
; Use insert to swap keyboard layouts
; and do not let Control, Alt, or Win modifiers act on Dvorak
dvorak=1

Loop {
   If(dvorak = 1)
   If !GetKeyState("Control")
   and !GetKeyState("Alt")
   and !GetKeyState("LWin")
   and !GetKeyState("RWin") {
      Suspend, Off
   } else {
      Suspend, On
   }
   Sleep, 10
}

Insert::
Suspend
Pause, , 1
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

~!Insert::
suspend, off
SetTimer, Refresh, 60000
return

Refresh:
{
Reload
return
}

; QWERTY to Dvorak mapping
-::[
=::]

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
