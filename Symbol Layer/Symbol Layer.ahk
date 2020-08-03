Menu, Tray, Icon, mmcndmgr.dll, 108
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force

Symbols = 0

#InputLevel 2
Gui, Color, FAFAFA
Gui, Add, Picture, x0 y0 w1016 h300 , Guide.png
Gui +LastFound +AlwaysOnTop +ToolWindow
WinSet, TransColor, FAFAFA
Gui -Caption
Return

~Pause::
{
	; If GetKeyState("Pause", "T")
	If Symbols = 0
	{
		Gui, Show, xCenter y1000 h300 w1016 NA, Symbol Layer
		Symbols:=1
		return
	}
	else
	{
		Symbols:=0
		Gui, Hide
		return
	}
	Return
}

; ┌───────────────────────────────────────────┐
; │    ↓↓↓ THIS IS WHERE KEY REMAPS GO ↓↓↓    │
; ╘═══════════════════════════════════════════╛

#If (Symbols = 1)
{
	`::Send {Text}○
	1::Send {Text}●
	2::Send {Text}□
	3::Send {Text}■
	4::Send {Text}▫
	5::Send {Text}▪
	6::Send {Text}╠
	7::Send {Text}╣
	8::Send {Text}╩
	9::Send {Text}╦
	0::Send {Text}╟
	-::Send {Text}╢
	=::Send {Text}╥
	
	q::Send {Text}╒
	w::Send {Text}╕
	e::Send {Text}╘
	r::Send {Text}╛
	t::Send {Text}╪
	y::Send {Text}╔
	u::Send {Text}╗
	i::Send {Text}╚
	o::Send {Text}╝
	p::Send {Text}═
	[::Send {Text}║
	]::Send {Text}╨
	\::Send {Text}╲
	
	a::Send {Text}╓
	s::Send {Text}╖
	d::Send {Text}╙
	f::Send {Text}╜
	g::Send {Text}╫
	h::Send {Text}┌
	j::Send {Text}┐
	k::Send {Text}└
	l::Send {Text}┘
	`;::Send {Text}─
	'::Send {Text}│
	
	z::Send {Text}╞
	x::Send {Text}╡
	c::Send {Text}╧
	v::Send {Text}╤
	b::Send {Text}╳
	n::Send {Text}├
	m::Send {Text}┤
	,::Send {Text}┴
	.::Send {Text}┬
	/::Send {Text}╱
	
	^Insert::Send {Text}↖ ; This is set to control insert so that it doesn't conflict with my dvorak script
	Delete::Send {Text}↙
	Home::Send {Text}↕
	End::Send {Text}↔
	PgUp::Send {Text}↗
	PgDn::Send {Text}↘
	
	Up::Send {Text}↑​
	Down::Send {Text}↓
	Left::Send {Text}←
	Right::Send {Text}→

	+Up::Send {Text}⇧
	+Down::Send {Text}⇩
	+Left::Send {Text}⇦
	+Right::Send {Text}⇨
}
#if
