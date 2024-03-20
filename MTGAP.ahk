Menu, Tray, Icon, networkexplorer.dll, 15

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, force
; Use insert to swap keyboard layouts
; and do not let Control, Alt, or Win modifiers act on mtgap
mtgap := 1

Insert::
{
If (mtgap = 1)
{
	mtgap := 0
	SetScrollLockState, % GetKeyState("ScrollLock", "T")? "Off":"On"
	Sleep, 200
	SetScrollLockState, % GetKeyState("ScrollLock", "T")? "Off":"On"
	Sleep, 200
	SetScrollLockState, % GetKeyState("ScrollLock", "T")? "Off":"On"
	Sleep, 200
	SetScrollLockState, % GetKeyState("ScrollLock", "T")? "Off":"On"
	Sleep, 200
}
else
{
	mtgap := 1
	SetScrollLockState, % GetKeyState("ScrollLock", "T")? "Off":"On"
	Sleep, 200
	SetScrollLockState, % GetKeyState("ScrollLock", "T")? "Off":"On"
	Sleep, 200
	SetScrollLockState, % GetKeyState("ScrollLock", "T")? "Off":"On"
	Sleep, 200
	SetScrollLockState, % GetKeyState("ScrollLock", "T")? "Off":"On"
	Sleep, 200
	SetScrollLockState, % GetKeyState("ScrollLock", "T")? "Off":"On"
	Sleep, 200
	SetScrollLockState, % GetKeyState("ScrollLock", "T")? "Off":"On"
	Sleep, 200
}
return
}

; QWERTY to MTGAP mapping
#If mtgap = 1 and !GetKeyState("Control") and !GetKeyState("Alt") and !GetKeyState("LWin") and !GetKeyState("RWin")
; -::[
; =::]

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
; [::/
; ]::=

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
#if