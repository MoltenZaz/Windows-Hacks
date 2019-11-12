Menu, Tray, Icon, pifmgr.dll, 13

#SingleInstance force

SetTitleMatchMode, 2

; Proudly Created by Mitchell Thomas

; This script enables me to use chrome in the background.
; If you press the menu/appskey (to the right of the right windows key on a full sized keyboard)
; as a modifier for another key the key you pressed will be sent to chrome in the background.
; This means you can fiddle with chrome without tabbing out of a game!
; When used in conjunction with the "Vimium" extension it enables easy navigation.

; Vimium firefox: https://addons.mozilla.org/en-US/firefox/addon/vimium-ff/
; Vimium chrome: https://chrome.google.com/webstore/detail/vimium/dbepggeogbaibhgnhhndojpepiihcmeb?hl=en)

; Here are my Vimium custom key mappings (remove the semicolons): 
;unmapAll
;map <backspace> goBack
;map \ LinkHints.activateMode
;map | LinkHints.activateModeToOpenInNewTab

; This means by pressing \ an overlay appears on all visable links on a webpage, you then type
; the assigned key combiniation to the link you want to click and vimium shall click it for you!

; I have it setup so that most common hotkey combinations will work (ctrl, alt, shift, ctrl + shift)
; The numpad is setup to change volume for my headphones when pressed without a hotkey, but when ctrl is used it
; will change the volume on my xbox and nintendo switch, which is hooked into line in and the audio out from my monitor's hdmi

; Rarely a game will require you to reload the script after opening it to work, GTA V is the only example i've come across

; You can toggle the script to be always on by pressing appskey + capslock (so that you dont have to keep holding appskey while typing)

ctrltoggle = 0
shifttoggle = 0
alttoggle = 0
toggle = 0
toggle2 = 0

~AppsKey & ~Capslock::
{
KeyDown := !KeyDown
If KeyDown
{
	ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome
	ControlFocus,,ahk_id %outputvar%
	toggle2 := 1
	mastertoggle := 1
	SoundBeep, 500, 50
}
Else
{
	toggle2 := 0
	if toggle = 0
	{
	mastertoggle := 0
	}
	SoundBeep, 250, 50
}
Return
}

AppsKey::
{
	ControlGet, OutputVar, Hwnd,,Chrome_RenderWidgetHostHWND1, Chrome
	ControlFocus,,ahk_id %outputvar%
	toggle := 1
	mastertoggle := 1
	keywait AppsKey
	toggle := 0
	if toggle2 = 0
	{
	mastertoggle := 0
	}
	return
}

#If (mastertoggle = 1)
{
LCtrl::
{
	ctrltoggle := 1
	keywait Ctrl
	ctrltoggle := 0
	return
}

LShift::
{
	shifttoggle := 1
	keywait Shift
	shifttoggle := 0
	return
}

LAlt::
{
	alttoggle := 1
	keywait Alt
	alttoggle := 0
	return
}
RCtrl::
{
	ctrltoggle := 1
	keywait Ctrl
	ctrltoggle := 0
	return
}

RShift::
{
	shifttoggle := 1
	keywait Shift
	shifttoggle := 0
	return
}

RAlt::
{
	alttoggle := 1
	keywait Alt
	alttoggle := 0
	return
}
}
#if

#if (ctrltoggle = 0 && shifttoggle = 0 && alttoggle = 0 && mastertoggle = 1)
{
; no modifiers go here
a::ControlSend, ahk_parent, a, Chrome
b::ControlSend, ahk_parent, b, Chrome
c::ControlSend, ahk_parent, c, Chrome
d::ControlSend, ahk_parent, d, Chrome
e::ControlSend, ahk_parent, e, Chrome
f::ControlSend, ahk_parent, f, Chrome
g::ControlSend, ahk_parent, g, Chrome
h::ControlSend, ahk_parent, h, Chrome
i::ControlSend, ahk_parent, i, Chrome
j::ControlSend, ahk_parent, j, Chrome
k::ControlSend, ahk_parent, k, Chrome
l::ControlSend, ahk_parent, l, Chrome
m::ControlSend, ahk_parent, m, Chrome
n::ControlSend, ahk_parent, n, Chrome
o::ControlSend, ahk_parent, o, Chrome
p::ControlSend, ahk_parent, p, Chrome
q::ControlSend, ahk_parent, q, Chrome
r::ControlSend, ahk_parent, r, Chrome
s::ControlSend, ahk_parent, s, Chrome
t::ControlSend, ahk_parent, t, Chrome
u::ControlSend, ahk_parent, u, Chrome
v::ControlSend, ahk_parent, v, Chrome
w::ControlSend, ahk_parent, w, Chrome
x::ControlSend, ahk_parent, x, Chrome
y::ControlSend, ahk_parent, y, Chrome
z::ControlSend, ahk_parent, z, Chrome
`::ControlSend, ahk_parent, ``, Chrome
1::ControlSend, ahk_parent, 1, Chrome
2::ControlSend, ahk_parent, 2, Chrome
3::ControlSend, ahk_parent, 3, Chrome
4::ControlSend, ahk_parent, 4, Chrome
5::ControlSend, ahk_parent, 5, Chrome
6::ControlSend, ahk_parent, 6, Chrome
7::ControlSend, ahk_parent, 7, Chrome
8::ControlSend, ahk_parent, 8, Chrome
9::ControlSend, ahk_parent, 9, Chrome
0::ControlSend, ahk_parent, 0, Chrome
-::ControlSend, ahk_parent, -, Chrome
=::ControlSend, ahk_parent, =, Chrome
[::ControlSend, ahk_parent, [, Chrome
]::ControlSend, ahk_parent, ], Chrome
\::ControlSend, ahk_parent, \, Chrome
`;::ControlSend, ahk_parent, `;, Chrome
'::ControlSend, ahk_parent, ', Chrome
,::ControlSend, ahk_parent, `,, Chrome
.::ControlSend, ahk_parent, ., Chrome
/::ControlSend, ahk_parent, /, Chrome
F1::ControlSend, ahk_parent, {F1}, Chrome
F2::ControlSend, ahk_parent, {F2}, Chrome
F3::ControlSend, ahk_parent, {F3}, Chrome
F4::ControlSend, ahk_parent, {F4}, Chrome
F5::ControlSend, ahk_parent, {F5}, Chrome
F6::ControlSend, ahk_parent, {F6}, Chrome
F7::ControlSend, ahk_parent, {F7}, Chrome
F8::ControlSend, ahk_parent, {F8}, Chrome
F9::ControlSend, ahk_parent, {F9}, Chrome
F10::ControlSend, ahk_parent, {F10}, Chrome
F11::ControlSend, ahk_parent, {F11}, Chrome
F12::ControlSend, ahk_parent, {F12}, Chrome
Enter::ControlSend, ahk_parent, {Enter}, Chrome
Tab::ControlSend, ahk_parent, {Tab}, Chrome
Left::ControlSend, ahk_parent, {Left}, Chrome
Right::ControlSend, ahk_parent, {Right}, Chrome
Up::ControlSend, ahk_parent, {Up}, Chrome
Down::ControlSend, ahk_parent, {Down}, Chrome
Backspace::ControlSend, ahk_parent, {Backspace}, Chrome
Delete::ControlSend, ahk_parent, {Delete}, Chrome
PgUp::ControlSend, ahk_parent, {PgUp}, Chrome
PgDn::ControlSend, ahk_parent, {PgDn}, Chrome
Space::ControlSend, ahk_parent, {Space}, Chrome
Home::ControlSend, ahk_parent, {Home}, Chrome
End::ControlSend, ahk_parent, {End}, Chrome
; The numpad is setup to change volume for my headphones when pressed without a hotkey, but when ctrl is used it
; will change the volume on my xbox and nintendo switch, which is hooked into line in and the audio out from my monitor's hdmi
; Numpad period is set to mute my xbox/switch

; YOU NEED TO HAVE NIRCMD AND SOUNDVOLUMEVIEW INSTALLED FOR THIS TO WORK!!!

; It also needs to be adapted for your setup!

NumpadDot::
{
run "F:\Documents\Nircmd\SoundVolumeView.exe" /Switch "Consoles"
SoundBeep, 250, 250
return
}

Pause::
{
Run "G:/AHK Current/Easy Window Organiser.ahk"
Reload
}
Numpad1::run "F:\Documents\Nircmd\SoundVolumeView.exe" /SetVolume "FiiO DAC-E10" 10
Numpad2::run "F:\Documents\Nircmd\SoundVolumeView.exe" /SetVolume "FiiO DAC-E10" 20
Numpad3::run "F:\Documents\Nircmd\SoundVolumeView.exe" /SetVolume "FiiO DAC-E10" 30
Numpad4::run "F:\Documents\Nircmd\SoundVolumeView.exe" /SetVolume "FiiO DAC-E10" 40
Numpad5::run "F:\Documents\Nircmd\SoundVolumeView.exe" /SetVolume "FiiO DAC-E10" 50
Numpad6::run "F:\Documents\Nircmd\SoundVolumeView.exe" /SetVolume "FiiO DAC-E10" 60
Numpad7::run "F:\Documents\Nircmd\SoundVolumeView.exe" /SetVolume "FiiO DAC-E10" 70
Numpad8::run "F:\Documents\Nircmd\SoundVolumeView.exe" /SetVolume "FiiO DAC-E10" 80
Numpad9::run "F:\Documents\Nircmd\SoundVolumeView.exe" /SetVolume "FiiO DAC-E10" 90
Numpad0::run "F:\Documents\Nircmd\SoundVolumeView.exe" /SetVolume "FiiO DAC-E10" 100

}

#if (ctrltoggle = 1 && shifttoggle = 0 && alttoggle = 0 && mastertoggle = 1)
{
; ctrl goes here
a::ControlSend, ahk_parent, {Ctrl down}a{Ctrl up}, Chrome
b::ControlSend, ahk_parent, {Ctrl down}b{Ctrl up}, Chrome
c::ControlSend, ahk_parent, {Ctrl down}c{Ctrl up}, Chrome
d::ControlSend, ahk_parent, {Ctrl down}d{Ctrl up}, Chrome
e::ControlSend, ahk_parent, {Ctrl down}e{Ctrl up}, Chrome
f::ControlSend, ahk_parent, {Ctrl down}f{Ctrl up}, Chrome
g::ControlSend, ahk_parent, {Ctrl down}g{Ctrl up}, Chrome
h::ControlSend, ahk_parent, {Ctrl down}h{Ctrl up}, Chrome
i::ControlSend, ahk_parent, {Ctrl down}i{Ctrl up}, Chrome
j::ControlSend, ahk_parent, {Ctrl down}j{Ctrl up}, Chrome
k::ControlSend, ahk_parent, {Ctrl down}k{Ctrl up}, Chrome
l::ControlSend, ahk_parent, {Ctrl down}l{Ctrl up}, Chrome
m::ControlSend, ahk_parent, {Ctrl down}m{Ctrl up}, Chrome
n::ControlSend, ahk_parent, {Ctrl down}n{Ctrl up}, Chrome
o::ControlSend, ahk_parent, {Ctrl down}o{Ctrl up}, Chrome
p::ControlSend, ahk_parent, {Ctrl down}p{Ctrl up}, Chrome
q::ControlSend, ahk_parent, {Ctrl down}q{Ctrl up}, Chrome
r::ControlSend, ahk_parent, {Ctrl down}r{Ctrl up}, Chrome
s::ControlSend, ahk_parent, {Ctrl down}s{Ctrl up}, Chrome
t::ControlSend, ahk_parent, {Ctrl down}t{Ctrl up}, Chrome
u::ControlSend, ahk_parent, {Ctrl down}u{Ctrl up}, Chrome
v::ControlSend, ahk_parent, {Ctrl down}v{Ctrl up}, Chrome
w::ControlSend, ahk_parent, {Ctrl down}w{Ctrl up}, Chrome
x::ControlSend, ahk_parent, {Ctrl down}x{Ctrl up}, Chrome
y::ControlSend, ahk_parent, {Ctrl down}y{Ctrl up}, Chrome
z::ControlSend, ahk_parent, {Ctrl down}z{Ctrl up}, Chrome
~::ControlSend, ahk_parent, {Ctrl down}``{Ctrl up}, Chrome
1::ControlSend, ahk_parent, {Ctrl down}1{Ctrl up}, Chrome
2::ControlSend, ahk_parent, {Ctrl down}2{Ctrl up}, Chrome
3::ControlSend, ahk_parent, {Ctrl down}3{Ctrl up}, Chrome
4::ControlSend, ahk_parent, {Ctrl down}4{Ctrl up}, Chrome
5::ControlSend, ahk_parent, {Ctrl down}5{Ctrl up}, Chrome
6::ControlSend, ahk_parent, {Ctrl down}6{Ctrl up}, Chrome
7::ControlSend, ahk_parent, {Ctrl down}7{Ctrl up}, Chrome
8::ControlSend, ahk_parent, {Ctrl down}8{Ctrl up}, Chrome
9::ControlSend, ahk_parent, {Ctrl down}9{Ctrl up}, Chrome
0::ControlSend, ahk_parent, {Ctrl down}0{Ctrl up}, Chrome
-::ControlSend, ahk_parent, {Ctrl down}-{Ctrl up}, Chrome
=::ControlSend, ahk_parent, {Ctrl down}={Ctrl up}, Chrome
[::ControlSend, ahk_parent, {Ctrl down}[{Ctrl up}, Chrome
]::ControlSend, ahk_parent, {Ctrl down}]{Ctrl up}, Chrome
\::ControlSend, ahk_parent, {Ctrl down}\{Ctrl up}, Chrome
`;::ControlSend, ahk_parent, {Ctrl down}`;{Ctrl up}, Chrome
'::ControlSend, ahk_parent, {Ctrl down}'{Ctrl up}, Chrome
,::ControlSend, ahk_parent, {Ctrl down}`,{Ctrl up}, Chrome
.::ControlSend, ahk_parent, {Ctrl down}.{Ctrl up}, Chrome
/::ControlSend, ahk_parent, {Ctrl down}/{Ctrl up}, Chrome
F1::ControlSend, ahk_parent, {Ctrl down}{F1}{Ctrl up}, Chrome
F2::ControlSend, ahk_parent, {Ctrl down}{F2}{Ctrl up}, Chrome
F3::ControlSend, ahk_parent, {Ctrl down}{F3}{Ctrl up}, Chrome
F4::ControlSend, ahk_parent, {Ctrl down}{F4}{Ctrl up}, Chrome
F5::ControlSend, ahk_parent, {Ctrl down}{F5}{Ctrl up}, Chrome
F6::ControlSend, ahk_parent, {Ctrl down}{F6}{Ctrl up}, Chrome
F7::ControlSend, ahk_parent, {Ctrl down}{F7}{Ctrl up}, Chrome
F8::ControlSend, ahk_parent, {Ctrl down}{F8}{Ctrl up}, Chrome
F9::ControlSend, ahk_parent, {Ctrl down}{F9}{Ctrl up}, Chrome
F10::ControlSend, ahk_parent, {Ctrl down}{F10}{Ctrl up}, Chrome
F11::ControlSend, ahk_parent, {Ctrl down}{F11}{Ctrl up}, Chrome
F12::ControlSend, ahk_parent, {Ctrl down}{F12}{Ctrl up}, Chrome
Enter::
{
ControlSend, ahk_parent, {Ctrl down}{t}{Ctrl up}, Chrome
Sleep, 1
ControlSend, ahk_parent, {Ctrl down}{w}{Ctrl up}, Chrome
;ControlSend, ahk_parent, ^{Enter}, Chrome
return
}
Tab::ControlSend, ahk_parent, {Ctrl down}{Tab}{Ctrl up}, Chrome
Left::ControlSend, ahk_parent, {Ctrl down}{Left}{Ctrl up}, Chrome
Right::ControlSend, ahk_parent, {Ctrl down}{Right}{Ctrl up}, Chrome
Up::ControlSend, ahk_parent, {Ctrl down}{Up}{Ctrl up}, Chrome
Down::ControlSend, ahk_parent, {Ctrl down}{Down}{Ctrl up}, Chrome
Backspace::ControlSend, ahk_parent, {Ctrl down}{Backspace}{Ctrl up}, Chrome
Delete::ControlSend, ahk_parent, {Ctrl down}{Delete}{Ctrl up}, Chrome
PgUp::ControlSend, ahk_parent, {Ctrl down}{PgUp}{Ctrl up}, Chrome
PgDn::ControlSend, ahk_parent, {Ctrl down}{PgDn}{Ctrl up}, Chrome
Space::ControlSend, ahk_parent, {Ctrl down}{space}{Ctrl up}, Chrome
Home::ControlSend, ahk_parent, {Ctrl down}{Home}{Ctrl up}, Chrome
End::ControlSend, ahk_parent, {Ctrl down}{End}{Ctrl up}, Chrome
Numpad1::run "F:\Documents\Nircmd\SoundVolumeView.exe" /SetVolume "Consoles" 10
Numpad2::run "F:\Documents\Nircmd\SoundVolumeView.exe" /SetVolume "Consoles" 20
Numpad3::run "F:\Documents\Nircmd\SoundVolumeView.exe" /SetVolume "Consoles" 30
Numpad4::run "F:\Documents\Nircmd\SoundVolumeView.exe" /SetVolume "Consoles" 40
Numpad5::run "F:\Documents\Nircmd\SoundVolumeView.exe" /SetVolume "Consoles" 50
Numpad6::run "F:\Documents\Nircmd\SoundVolumeView.exe" /SetVolume "Consoles" 60
Numpad7::run "F:\Documents\Nircmd\SoundVolumeView.exe" /SetVolume "Consoles" 70
Numpad8::run "F:\Documents\Nircmd\SoundVolumeView.exe" /SetVolume "Consoles" 80
Numpad9::run "F:\Documents\Nircmd\SoundVolumeView.exe" /SetVolume "Consoles" 90
Numpad0::run "F:\Documents\Nircmd\SoundVolumeView.exe" /SetVolume "Consoles" 100
^a::return
}
#if (ctrltoggle = 1 && shifttoggle = 1 && alttoggle = 0 && mastertoggle = 1)
{
; ctrl shift goes here
a::ControlSend, ahk_parent, {Ctrl down}{Shift down}a{Ctrl up}{Shift up}, Chrome
b::ControlSend, ahk_parent, {Ctrl down}{Shift down}b{Ctrl up}{Shift up}, Chrome
c::ControlSend, ahk_parent, {Ctrl down}{Shift down}c{Ctrl up}{Shift up}, Chrome
d::ControlSend, ahk_parent, {Ctrl down}{Shift down}d{Ctrl up}{Shift up}, Chrome
e::ControlSend, ahk_parent, {Ctrl down}{Shift down}e{Ctrl up}{Shift up}, Chrome
f::ControlSend, ahk_parent, {Ctrl down}{Shift down}f{Ctrl up}{Shift up}, Chrome
g::ControlSend, ahk_parent, {Ctrl down}{Shift down}g{Ctrl up}{Shift up}, Chrome
h::ControlSend, ahk_parent, {Ctrl down}{Shift down}h{Ctrl up}{Shift up}, Chrome
i::ControlSend, ahk_parent, {Ctrl down}{Shift down}i{Ctrl up}{Shift up}, Chrome
j::ControlSend, ahk_parent, {Ctrl down}{Shift down}j{Ctrl up}{Shift up}, Chrome
k::ControlSend, ahk_parent, {Ctrl down}{Shift down}k{Ctrl up}{Shift up}, Chrome
l::ControlSend, ahk_parent, {Ctrl down}{Shift down}l{Ctrl up}{Shift up}, Chrome
m::ControlSend, ahk_parent, {Ctrl down}{Shift down}m{Ctrl up}{Shift up}, Chrome
n::ControlSend, ahk_parent, {Ctrl down}{Shift down}n{Ctrl up}{Shift up}, Chrome
o::ControlSend, ahk_parent, {Ctrl down}{Shift down}o{Ctrl up}{Shift up}, Chrome
p::ControlSend, ahk_parent, {Ctrl down}{Shift down}p{Ctrl up}{Shift up}, Chrome
q::ControlSend, ahk_parent, {Ctrl down}{Shift down}q{Ctrl up}{Shift up}, Chrome
r::ControlSend, ahk_parent, {Ctrl down}{Shift down}r{Ctrl up}{Shift up}, Chrome
s::ControlSend, ahk_parent, {Ctrl down}{Shift down}s{Ctrl up}{Shift up}, Chrome
t::ControlSend, ahk_parent, {Ctrl down}{Shift down}t{Ctrl up}{Shift up}, Chrome
u::ControlSend, ahk_parent, {Ctrl down}{Shift down}u{Ctrl up}{Shift up}, Chrome
v::ControlSend, ahk_parent, {Ctrl down}{Shift down}v{Ctrl up}{Shift up}, Chrome
w::ControlSend, ahk_parent, {Ctrl down}{Shift down}w{Ctrl up}{Shift up}, Chrome
x::ControlSend, ahk_parent, {Ctrl down}{Shift down}x{Ctrl up}{Shift up}, Chrome
y::ControlSend, ahk_parent, {Ctrl down}{Shift down}y{Ctrl up}{Shift up}, Chrome
z::ControlSend, ahk_parent, {Ctrl down}{Shift down}z{Ctrl up}{Shift up}, Chrome
Tab::ControlSend, ahk_parent, {Ctrl down}{Shift down}{Tab}{Ctrl up}{Shift up}, Chrome
Left::ControlSend, ahk_parent, {Ctrl down}{Shift down}{Left}{Ctrl up}{Shift up}, Chrome
Right::ControlSend, ahk_parent, {Ctrl down}{Shift down}{Right}{Ctrl up}{Shift up}, Chrome
Up::ControlSend, ahk_parent, {Ctrl down}{Shift down}{Up}{Ctrl up}{Shift up}, Chrome
Down::ControlSend, ahk_parent, {Ctrl down}{Shift down}{Down}{Ctrl up}{Shift up}, Chrome
Backspace::ControlSend, ahk_parent, {Ctrl down}{Shift down}{Backspace}{Ctrl up}{Shift up}, Chrome
Delete::ControlSend, ahk_parent, {Ctrl down}{Shift down}{Delete}{Ctrl up}{Shift up}, Chrome
PgUp::ControlSend, ahk_parent, {Ctrl down}{Shift down}{PgUp}{Ctrl up}{Shift up}, Chrome
PgDn::ControlSend, ahk_parent, {Ctrl down}{Shift down}{PgDn}{Ctrl up}{Shift up}, Chrome
Home::ControlSend, ahk_parent, {Ctrl down}{Shift down}{Home}{Ctrl up}{Shift up}, Chrome
End::ControlSend, ahk_parent, {Ctrl down}{Shift down}{End}{Ctrl up}{Shift up}, Chrome
}

#if (ctrltoggle = 0 && shifttoggle = 0 && alttoggle = 1 && mastertoggle = 1)
{
; alt goes here
a::ControlSend, ahk_parent, {Alt down}a{Alt up}, Chrome
b::ControlSend, ahk_parent, {Alt down}b{Alt up}, Chrome
c::ControlSend, ahk_parent, {Alt down}c{Alt up}, Chrome
d::ControlSend, ahk_parent, {Alt down}d{Alt up}, Chrome
e::ControlSend, ahk_parent, {Alt down}e{Alt up}, Chrome
f::ControlSend, ahk_parent, {Alt down}f{Alt up}, Chrome
g::ControlSend, ahk_parent, {Alt down}g{Alt up}, Chrome
h::ControlSend, ahk_parent, {Alt down}h{Alt up}, Chrome
i::ControlSend, ahk_parent, {Alt down}i{Alt up}, Chrome
j::ControlSend, ahk_parent, {Alt down}j{Alt up}, Chrome
k::ControlSend, ahk_parent, {Alt down}k{Alt up}, Chrome
l::ControlSend, ahk_parent, {Alt down}l{Alt up}, Chrome
m::ControlSend, ahk_parent, {Alt down}m{Alt up}, Chrome
n::ControlSend, ahk_parent, {Alt down}n{Alt up}, Chrome
o::ControlSend, ahk_parent, {Alt down}o{Alt up}, Chrome
p::ControlSend, ahk_parent, {Alt down}p{Alt up}, Chrome
q::ControlSend, ahk_parent, {Alt down}q{Alt up}, Chrome
r::ControlSend, ahk_parent, {Alt down}r{Alt up}, Chrome
s::ControlSend, ahk_parent, {Alt down}s{Alt up}, Chrome
t::ControlSend, ahk_parent, {Alt down}t{Alt up}, Chrome
u::ControlSend, ahk_parent, {Alt down}u{Alt up}, Chrome
v::ControlSend, ahk_parent, {Alt down}v{Alt up}, Chrome
w::ControlSend, ahk_parent, {Alt down}w{Alt up}, Chrome
x::ControlSend, ahk_parent, {Alt down}x{Alt up}, Chrome
y::ControlSend, ahk_parent, {Alt down}y{Alt up}, Chrome
z::ControlSend, ahk_parent, {Alt down}z{Alt up}, Chrome
`::ControlSend, ahk_parent, {Alt down}``{Alt up}, Chrome
1::ControlSend, ahk_parent, {Alt down}1{Alt up}, Chrome
2::ControlSend, ahk_parent, {Alt down}2{Alt up}, Chrome
3::ControlSend, ahk_parent, {Alt down}3{Alt up}, Chrome
4::ControlSend, ahk_parent, {Alt down}4{Alt up}, Chrome
5::ControlSend, ahk_parent, {Alt down}5{Alt up}, Chrome
6::ControlSend, ahk_parent, {Alt down}6{Alt up}, Chrome
7::ControlSend, ahk_parent, {Alt down}7{Alt up}, Chrome
8::ControlSend, ahk_parent, {Alt down}8{Alt up}, Chrome
9::ControlSend, ahk_parent, {Alt down}9{Alt up}, Chrome
0::ControlSend, ahk_parent, {Alt down}0{Alt up}, Chrome
-::ControlSend, ahk_parent, {Alt down}-{Alt up}, Chrome
=::ControlSend, ahk_parent, {Alt down}={Alt up}, Chrome
[::ControlSend, ahk_parent, {Alt down}[{Alt up}, Chrome
]::ControlSend, ahk_parent, {Alt down}]{Alt up}, Chrome
\::ControlSend, ahk_parent, {Alt down}\{Alt up}, Chrome
`;::ControlSend, ahk_parent, {Alt down}`;{Alt up}, Chrome
'::ControlSend, ahk_parent, {Alt down}'{Alt up}, Chrome
,::ControlSend, ahk_parent, {Alt down}`{Alt up},, Chrome
.::ControlSend, ahk_parent, {Alt down}.{Alt up}, Chrome
/::ControlSend, ahk_parent, {Alt down}/{Alt up}, Chrome
F1::ControlSend, ahk_parent, {Alt down}{F1}{Alt up}, Chrome
F2::ControlSend, ahk_parent, {Alt down}{F2}{Alt up}, Chrome
F3::ControlSend, ahk_parent, {Alt down}{F3}{Alt up}, Chrome
F4::ControlSend, ahk_parent, {Alt down}{F4}{Alt up}, Chrome
F5::ControlSend, ahk_parent, {Alt down}{F5}{Alt up}, Chrome
F6::ControlSend, ahk_parent, {Alt down}{F6}{Alt up}, Chrome
F7::ControlSend, ahk_parent, {Alt down}{F7}{Alt up}, Chrome
F8::ControlSend, ahk_parent, {Alt down}{F8}{Alt up}, Chrome
F9::ControlSend, ahk_parent, {Alt down}{F9}{Alt up}, Chrome
F10::ControlSend, ahk_parent, {Alt down}{F10}{Alt up}, Chrome
F11::ControlSend, ahk_parent, {Alt down}{F11}{Alt up}, Chrome
F12::ControlSend, ahk_parent, {Alt down}{F12}{Alt up}, Chrome
Enter::ControlSend, ahk_parent, {Alt down}{Enter}{Alt up}, Chrome
Tab::Send, !{tab}
Left::ControlSend, ahk_parent, {Alt down}{Left}{Alt up}, Chrome
Right::ControlSend, ahk_parent, {Alt down}{Right}{Alt up}, Chrome
Up::ControlSend, ahk_parent, {Alt down}{Up}{Alt up}, Chrome
Down::ControlSend, ahk_parent, {Alt down}{Down}{Alt up}, Chrome
Backspace::ControlSend, ahk_parent, {Alt down}{Backspace}{Alt up}, Chrome
Delete::ControlSend, ahk_parent, {Alt down}{Delete}{Alt up}, Chrome
PgUp::ControlSend, ahk_parent, {Alt down}{PgUp}{Alt up}, Chrome
PgDn::ControlSend, ahk_parent, {Alt down}{PgDn}{Alt up}, Chrome
Space::ControlSend, ahk_parent, {Alt down}{space}{Alt up}, Chrome
Home::ControlSend, ahk_parent, {Alt down}{Home}{Alt up}, Chrome
End::ControlSend, ahk_parent, {Alt down}{End}{Alt up}, Chrome
}

#if (ctrltoggle = 0 && shifttoggle = 1 && alttoggle = 0 && mastertoggle = 1)
{
; shift goes here

a::ControlSend, ahk_parent, {Shift down}a{Shift up}, Chrome
b::ControlSend, ahk_parent, {Shift down}b{Shift up}, Chrome
c::ControlSend, ahk_parent, {Shift down}c{Shift up}, Chrome
d::ControlSend, ahk_parent, {Shift down}d{Shift up}, Chrome
e::ControlSend, ahk_parent, {Shift down}e{Shift up}, Chrome
f::ControlSend, ahk_parent, {Shift down}f{Shift up}, Chrome
g::ControlSend, ahk_parent, {Shift down}g{Shift up}, Chrome
h::ControlSend, ahk_parent, {Shift down}h{Shift up}, Chrome
i::ControlSend, ahk_parent, {Shift down}i{Shift up}, Chrome
j::ControlSend, ahk_parent, {Shift down}j{Shift up}, Chrome
k::ControlSend, ahk_parent, {Shift down}k{Shift up}, Chrome
l::ControlSend, ahk_parent, {Shift down}l{Shift up}, Chrome
m::ControlSend, ahk_parent, {Shift down}m{Shift up}, Chrome
n::ControlSend, ahk_parent, {Shift down}n{Shift up}, Chrome
o::ControlSend, ahk_parent, {Shift down}o{Shift up}, Chrome
p::ControlSend, ahk_parent, {Shift down}p{Shift up}, Chrome
q::ControlSend, ahk_parent, {Shift down}q{Shift up}, Chrome
r::ControlSend, ahk_parent, {Shift down}r{Shift up}, Chrome
s::ControlSend, ahk_parent, {Shift down}s{Shift up}, Chrome
t::ControlSend, ahk_parent, {Shift down}t{Shift up}, Chrome
u::ControlSend, ahk_parent, {Shift down}u{Shift up}, Chrome
v::ControlSend, ahk_parent, {Shift down}v{Shift up}, Chrome
w::ControlSend, ahk_parent, {Shift down}w{Shift up}, Chrome
x::ControlSend, ahk_parent, {Shift down}x{Shift up}, Chrome
y::ControlSend, ahk_parent, {Shift down}y{Shift up}, Chrome
z::ControlSend, ahk_parent, {Shift down}z{Shift up}, Chrome
`::ControlSend, ahk_parent, {Shift down}``{Shift up}, Chrome
1::ControlSend, ahk_parent, {Shift down}1{Shift up}, Chrome
2::ControlSend, ahk_parent, {Shift down}2{Shift up}, Chrome
3::ControlSend, ahk_parent, {Shift down}3{Shift up}, Chrome
4::ControlSend, ahk_parent, {Shift down}4{Shift up}, Chrome
5::ControlSend, ahk_parent, {Shift down}5{Shift up}, Chrome
6::ControlSend, ahk_parent, {Shift down}6{Shift up}, Chrome
7::ControlSend, ahk_parent, {Shift down}7{Shift up}, Chrome
8::ControlSend, ahk_parent, {Shift down}8{Shift up}, Chrome
9::ControlSend, ahk_parent, {Shift down}9{Shift up}, Chrome
0::ControlSend, ahk_parent, {Shift down}0{Shift up}, Chrome
-::ControlSend, ahk_parent, {Shift down}-{Shift up}, Chrome
=::ControlSend, ahk_parent, {Shift down}={Shift up}, Chrome
[::ControlSend, ahk_parent, {Shift down}[{Shift up}, Chrome
]::ControlSend, ahk_parent, {Shift down}]{Shift up}, Chrome
\::ControlSend, ahk_parent, {Shift down}\{Shift up}, Chrome
`;::ControlSend, ahk_parent, {Shift down}`;{Shift up}, Chrome
'::ControlSend, ahk_parent, {Shift down}'{Shift up}, Chrome
,::ControlSend, ahk_parent, {Shift down}`,{Shift up}, Chrome
.::ControlSend, ahk_parent, {Shift down}.{Shift up}, Chrome
/::ControlSend, ahk_parent, {Shift down}/{Shift up}, Chrome
F1::ControlSend, ahk_parent, {Shift down}{F1}{Shift up}, Chrome
F2::ControlSend, ahk_parent, {Shift down}{F2}{Shift up}, Chrome
F3::ControlSend, ahk_parent, {Shift down}{F3}{Shift up}, Chrome
F4::ControlSend, ahk_parent, {Shift down}{F4}{Shift up}, Chrome
F5::ControlSend, ahk_parent, {Shift down}{F5}{Shift up}, Chrome
F6::ControlSend, ahk_parent, {Shift down}{F6}{Shift up}, Chrome
F7::ControlSend, ahk_parent, {Shift down}{F7}{Shift up}, Chrome
F8::ControlSend, ahk_parent, {Shift down}{F8}{Shift up}, Chrome
F9::ControlSend, ahk_parent, {Shift down}{F9}{Shift up}, Chrome
F10::ControlSend, ahk_parent, {Shift down}{F10}{Shift up}, Chrome
F11::ControlSend, ahk_parent, {Shift down}{F11}{Shift up}, Chrome
F12::ControlSend, ahk_parent, {Shift down}{F12}{Shift up}, Chrome
Enter::ControlSend, ahk_parent, {Shift down}{Enter}{Shift up}, Chrome
Tab::ControlSend, ahk_parent, {Shift down}{Tab}{Shift up}, Chrome
Left::ControlSend, ahk_parent, {Shift down}{Left}{Shift up}, Chrome
Right::ControlSend, ahk_parent, {Shift down}{Right}{Shift up}, Chrome
Up::ControlSend, ahk_parent, {Shift down}{Up}{Shift up}, Chrome
Down::ControlSend, ahk_parent, {Shift down}{Down}{Shift up}, Chrome
Backspace::ControlSend, ahk_parent, {Shift down}{Backspace}{Shift up}, Chrome
Delete::ControlSend, ahk_parent, {Shift down}{Delete}{Shift up}, Chrome
PgUp::ControlSend, ahk_parent, {Shift down}{PgUp}{Shift up}, Chrome
PgDn::ControlSend, ahk_parent, {Shift down}{PgDn}{Shift up}, Chrome
Space::ControlSend, ahk_parent, {Shift down}{space}{Shift up}, Chrome
Home::ControlSend, ahk_parent, {Shift down}{Home}{Shift up}, Chrome
End::ControlSend, ahk_parent, {Shift down}{End}{Shift up}, Chrome
}

; These hotkeys don't require the appskey

#if
Media_Play_Pause::
{
ControlSend, ahk_parent, {Media_Play_Pause}, Chrome
}

#+F1::
{
;run "C:\Program Files (x86)\Dell\Dell Display Manager\ddm.exe" /1:SetActiveInput mDP /Exit
run "F:\Documents\Nircmd\SoundVolumeView.exe" /Mute "Consoles"
return
}

#+F2::
{
run "F:\Documents\Nircmd\SoundVolumeView.exe" /Unmute "Consoles"
run "C:\Program Files (x86)\Dell\Dell Display Manager\ddm.exe" /1:SetActiveInput HDMI /Exit
return
}

#+F3::
{
run "F:\Documents\Nircmd\SoundVolumeView.exe" /Unmute "Consoles"
run "C:\Program Files (x86)\Dell\Dell Display Manager\ddm.exe" /1:SetActiveInput HDMI2 /Exit
return
}

~Scrolllock::
{
GetKeyState, state, ScrollLock, T ; state will be 'D' if ScrollLock is on or 'U' if it is off
if ( state = "D" )
{
      run "F:\Documents\Nircmd\SoundVolumeView.exe" /Mute "RODE Microphone"
}
   Else
{
      run "F:\Documents\Nircmd\SoundVolumeView.exe" /Unmute "RODE Microphone"
}
return
}
