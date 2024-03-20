Menu, Tray, Icon, networkexplorer.dll, 15

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, force
; Use insert to swap keyboard layouts
; and do not let Control, Alt, or Win modifiers act on mtgap
mtgap := 1
caps := 0
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

*CapsLock::
{
caps := 1
KeyWait, CapsLock
caps := 0
return
}

#CapsLock::CapsLock

; QWERTY to MTGAP mapping
#If mtgap = 1 and !GetKeyState("Control") and !GetKeyState("Alt") and !GetKeyState("LWin") and !GetKeyState("RWin") and if caps = 0
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

#If mtgap = 1 and !GetKeyState("Control") and !GetKeyState("Alt") and !GetKeyState("LWin") and !GetKeyState("RWin") and if caps = 1
; -::[
; =::]

q::w
w::c
e::l
r::d
t::k
y::j
u::u
i::o
o::p
p::y
; [::/
; ]::=

a::r
s::s
d::t
f::h
g::m
h::.
j::a
k::e
l::n
`;::i
'::/

z::x
x::v
c::g
v::f
b::b
n::`;
m::,
,::'
.::z
/::q
#if

#If caps = 1 and mtgap = 0
; -::[
; =::]

q::p
w::o
e::i
r::u
t::y
y::t
u::r
i::e
o::w
p::q
; [::/
; ]::=

a::`;
s::l
d::k
f::j
g::h
h::g
j::f
k::d
l::s
`;::a
; '::/

z::/
x::.
c::,
v::m
b::n
n::b
m::v
,::c
.::x
/::z
#if
