Menu, Tray, Icon, pifmgr.dll, 18

; make forward and back mouse buttons dive in and out of nodes in houdini
; multiple other bindings for houdini, including different hotkeys when two are pressed at once
#IfWinActive,ahk_exe houdinifx.exe
{
~Xbutton1 & Xbutton2::
{
Send, ^2
return
}
F22::1
F23::2
F23 & F22::
{
Send, {v down}
keywait, F22
Send, {v up}
return
}
~Xbutton2 & Xbutton1::
{
Send, ^1
return
}
F22 & F23::
{
Send, {c down}
keywait, F23
Send, {c up}
return
}
~Xbutton1::u
~Xbutton2::i
#u::
#i::
return
; make F21 send up twice then ctrl up on each sequential keypress (play, pause, rewind)
F21::
{
if b = 1
{
Send ^{Up}
b = 2
}
else
{
if b = 0
{
Send {Up}
b = 1
}
else
{
Send {Up}
b = 0
}
}
keywait, F21
return
}
F24::
{
If (A_PriorHotKey = A_ThisHotKey and A_TimeSincePriorHotkey < 500)
{
Send, {space}g
return
}
else
{
Send, {space}h
return
}
Return
}
}

#IfWinActive,ahk_exe happrentice.exe
{
~Xbutton1 & Xbutton2::
{
Send, ^2
return
}
F22::1
F23::2
F23 & F22::
{
Send, {v down}
keywait, F22
Send, {v up}
return
}
~Xbutton2 & Xbutton1::
{
Send, ^1
return
}
F22 & F23::
{
Send, {c down}
keywait, F23
Send, {c up}
return
}
~Xbutton1::u
~Xbutton2::i
#u::
#i::
return
; make F21 send up twice then ctrl up on each sequential keypress (play, pause, rewind)
F21::
{
if b = 1
{
Send ^{Up}
b = 2
}
else
{
if b = 0
{
Send {Up}
b = 1
}
else
{
Send {Up}
b = 0
}
}
keywait, F21
return
}
F24::
{
If (A_PriorHotKey = A_ThisHotKey and A_TimeSincePriorHotkey < 500)
{
Send, {space}g
return
}
else
{
Send, {space}h
return
}
Return
}
}

#IfWinActive,ahk_exe houdini.exe
{
~Xbutton1 & Xbutton2::
{
Send, ^2
return
}
F22::1
F23::2
F23 & F22::
{
Send, {v down}
keywait, F22
Send, {v up}
return
}
~Xbutton2 & Xbutton1::
{
Send, ^1
return
}
F22 & F23::
{
Send, {c down}
keywait, F23
Send, {c up}
return
}
~Xbutton1::u
~Xbutton2::i
#u::
#i::
return
; make F21 send up twice then ctrl up on each sequential keypress (play, pause, rewind)
F21::
{
if b = 1
{
Send ^{Up}
b = 2
}
else
{
if b = 0
{
Send {Up}
b = 1
}
else
{
Send {Up}
b = 0
}
}
keywait, F21
return
}
F24::
{
If (A_PriorHotKey = A_ThisHotKey and A_TimeSincePriorHotkey < 500)
{
Send, {space}g
return
}
else
{
Send, {space}h
return
}
Return
}
}

#IfWinActive,ahk_exe mplay.exe
{
~Xbutton1 & Xbutton2::
{
Send, ^2
return
}
F22::1
F23::2
F23 & F22::
{
Send, {v down}
keywait, F22
Send, {v up}
return
}
~Xbutton2 & Xbutton1::
{
Send, ^1
return
}
F22 & F23::
{
Send, {c down}
keywait, F23
Send, {c up}
return
}
~Xbutton1::u
~Xbutton2::i
#u::
#i::
return
; make F21 send up twice then ctrl up on each sequential keypress (play, pause, rewind)
F21::
{
if b = 1
{
Send ^{Up}
b = 2
}
else
{
if b = 0
{
Send {Up}
b = 1
}
else
{
Send {Up}
b = 0
}
}
keywait, F21
return
}
F24::
{
If (A_PriorHotKey = A_ThisHotKey and A_TimeSincePriorHotkey < 500)
{
Send, {space}g
return
}
else
{
Send, {space}h
return
}
Return
}
}

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

; Make windows + s open snipping tool and create a new snip

#IfWinExist

AppsKey & NumpadMult::
{
isFullScreen := isWindowFullScreen( "A" )
if isFullScreen = 0
{
IfWinExist Snip & Sketch
{
	WinActivate
	WinWait,  Snip & Sketch,,2
	Send ^n
}
else
{
	Run "F:\Snip & Sketch.lnk"
	sleep, 500
	send, ^n
}
}
return
}

PrintScreen::
{
isFullScreen := isWindowFullScreen( "A" )
if isFullScreen = 0
{
IfWinExist Snipping Tool
{
	WinActivate
	WinWait,  Snipping Tool,,2
	Send ^n
}
else
{
	Run "c:\windows\system32\SnippingTool.exe"
	WinWait,  Snipping Tool,,2
	ControlClick, x40 y40, Snipping Tool
}
}
return
}

; make win F1 F13, in displayfusion this puts the mouse cursor on the left most monitor
#F1::F13
