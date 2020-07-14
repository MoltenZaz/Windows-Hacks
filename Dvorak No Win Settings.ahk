Menu, Tray, Icon, networkexplorer.dll, 15

#InputLevel 1
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#MaxHotkeysPerInterval, 10000
#SingleInstance Force

dvorak = 1
LSpace = 0
RSpace = 0

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
<!>!a::Send {Text}1
<!>!s::Send {Text}2
<!>!d::Send {Text}3
<!>!f::Send {Text}4
<!>!g::Send {Text}5
<!>!h::Send {Text}6
<!>!j::Send {Text}7
<!>!k::Send {Text}8
<!>!l::Send {Text}9
<!>!`;::Send {Text}0

<!>!+a::Send {Text}!
<!>!+s::Send {Text}@
<!>!+d::Send {Text}#
<!>!+f::Send {Text}$
<!>!+g::Send {Text}`%
<!>!+h::Send {Text}^
<!>!+j::Send {Text}&
<!>!+k::Send {Text}*
<!>!+l::Send {Text}°
<!>!+`;::Send {Text}—
#if 

; —————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————
; If Control alt lwin rwin and f13 arent being pressed and dvorak is set to 1 then remap to dvorak with space cadet shifts
; —————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————

#If !GetKeyState("Control") and !GetKeyState("Alt") and !GetKeyState("LWin") and !GetKeyState("RWin") and dvorak = 1 and !GetKeyState("F13")
{
; Space Cadet Shift with {} when both are pressed.

~*RShift::
{
KeyWait, RShift
If (A_TimeSinceThisHotkey < 150 and A_PriorKey = "RShift" and !GetKeyState("LShift"))
{
	SendRaw, )
}
If (A_TimeSinceThisHotkey < 150 and GetKeyState("LShift"))
{
	SendRaw, }
}
return
}

~*LShift::
{
KeyWait, LShift
If (A_TimeSinceThisHotkey < 150 and A_PriorKey = "LShift" and !GetKeyState("RShift"))
{
	SendRaw, (
}
If (A_TimeSinceThisHotkey < 150 and GetKeyState("RShift"))
{
	SendRaw, {
}
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
}
#if
