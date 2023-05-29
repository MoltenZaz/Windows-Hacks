Menu, Tray, Icon, pifmgr.dll, 18
#InputLevel 0
#SingleInstance force

;F1::
;{
;Send, +{tab}
;Sleep, 500
;Send, {down}
;Sleep, 1000
;Send, {LButton}
;return
;}

;^!Space:: Winset, Alwaysontop, , A

^Esc::Send, {Esc}

#1::^#1
#2::^#2
#3::^#3
#4::^#4
#5::^#5
#6::^#6
#7::^#7
#8::^#8
#9::^#9
#0::^#0

+#1::+#1
+#2::+#2
+#3::+#3
+#4::+#4
+#5::+#5
+#6::+#6
+#7::+#7
+#8::+#8
+#9::+#9
+#0::+#0

#f::Send, f

#h::Send, h

#s::Send, s

#+f::Send, F

#^Enter::Send, {Enter}

#^n::Send, n

#^+b::Send, b

#^!+w::return

#^!+t::return

#^!+y::return

#^!+o::return

#^!+p::return

#^!+d::return

#^!+l::return

#^!+x::return

#^!+n::return

; #Space::Send, {Space}

#^!+Space::return

$#^!Shift::return

$#^+Alt::return

$#!+Ctrl::return

$^!+LWin::return

$^!+RWin::return

~NumLock::
{
KeyWait, NumLock
KeyWait, NumLock, D T0.2
If ErrorLevel
{
	return
}
else
{
	Run calc.exe
}
return
}

; make forward and back mouse buttons dive in and out of nodes in houdini
; multiple other bindings for houdini, including different hotkeys when two are pressed at once
#IfWinActive,ahk_exe houdinifx.exe
{
F18::1
F19::2

F19 & F18::Send, ^1
F18 & F19::Send, ^2

~Xbutton1 & Xbutton2::
{
Send, 3
return
}

~Xbutton2 & Xbutton1::
{
Send, 4
return
}

~Xbutton1::u
~Xbutton2::i

F22::Esc

F21 & F22::
{
Send, {space down}
KeyWait, F22
Send, h{space up}
return
}

F21::
{
If (A_PriorHotKey = A_ThisHotKey and A_TimeSincePriorHotkey < 500)
{
Send, {space down}
KeyWait, F22
Send, g{space up}
return
}
else
{
Send, {space down}
KeyWait, F22
Send, f{space up}
return
}
Return
}
}
#if

#IfWinActive,ahk_exe happrentice.exe
{
F18::1
F19::2

F19 & F18::Send, ^1
F18 & F19::Send, ^2

~Xbutton1 & Xbutton2::
{
Send, 3
return
}

~Xbutton2 & Xbutton1::
{
Send, 4
return
}

~Xbutton1::u
~Xbutton2::i

F22::Esc

F21 & F22::
{
Send, {space down}
KeyWait, F22
Send, h{space up}
return
}

F21::
{
If (A_PriorHotKey = A_ThisHotKey and A_TimeSincePriorHotkey < 500)
{
Send, {space down}
KeyWait, F22
Send, g{space up}
return
}
else
{
Send, {space down}
KeyWait, F22
Send, f{space up}
return
}
Return
}
}
#if

#IfWinActive,ahk_exe houdini.exe
{
F18::1
F19::2

F19 & F18::Send, ^1
F18 & F19::Send, ^2

~Xbutton1 & Xbutton2::
{
Send, 3
return
}

~Xbutton2 & Xbutton1::
{
Send, 4
return
}

~Xbutton1::u
~Xbutton2::i

F22::Esc

F21 & F22::
{
Send, {space down}
KeyWait, F22
Send, h{space up}
return
}

F21::
{
If (A_PriorHotKey = A_ThisHotKey and A_TimeSincePriorHotkey < 500)
{
Send, {space down}
KeyWait, F22
Send, g{space up}
return
}
else
{
Send, {space down}
KeyWait, F22
Send, f{space up}
return
}
Return
}
}
#if

#IfWinActive,ahk_exe mplay.exe
{
F18::1
F19::2

F19 & F18::Send, ^1
F18 & F19::Send, ^2

~Xbutton1 & Xbutton2::
{
Send, 3
return
}

~Xbutton2 & Xbutton1::
{
Send, 4
return
}

~Xbutton1::u
~Xbutton2::i

F22::Esc

F21 & F22::
{
Send, {space down}
KeyWait, F22
Send, h{space up}
return
}

F21::
{
If (A_PriorHotKey = A_ThisHotKey and A_TimeSincePriorHotkey < 500)
{
Send, {space down}
KeyWait, F22
Send, g{space up}
return
}
else
{
Send, {space down}
KeyWait, F22
Send, f{space up}
return
}
Return
}
}
#if

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

; Make F2 toggle between pressing alt + shift + r and alt + shift + n (changes between clear and normal brush modes in photoshop)
#IfWinActive,ahk_exe photoshop.exe
{
F2::
if a = 1
{
Send {LAlt Down}{LShift Down}n
Send {LShift Up}{LAlt Up}
a = 0
}
else
{
Send {LAlt Down}{LShift Down}r
Send {LShift Up}{LAlt Up}
a = 1
}
keywait, F2
return
}
#if

; Make windows + s open snipping tool and create a new snip
;PrintScreen::
;{
;isFullScreen := isWindowFullScreen( "A" )
;if isFullScreen = 0
;{
;IfWinExist Snipping Tool
;{
;	WinActivate
;	WinWait,  Snipping Tool,,2
;	Send ^n
;}
;else
;{
;	Run "c:\windows\system32\SnippingTool.exe"
;	WinWait,  Snipping Tool,,2
;	ControlClick, x40 y40, Snipping Tool
;}
;}
;return
;}