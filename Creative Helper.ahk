Menu, Tray, Icon, pifmgr.dll, 18

; Created by Mitchell Thomas

; This script adds custom hotkeys to Houdini and Photoshop
; It also enables snipping tool when Windows + s is pressed and immediatly starts a snip

; This section is for houdini hotkeys
#IfWinActive,ahk_exe houdinifx.exe or WinActive ahk_exe mplay.exe or WinActive ahk_exe houdini.exe
{
; Pressing forward and back will set a quick marker
~Xbutton2 & Xbutton1::
{
Send, ^1
return
}
; Pressing forward and back in the opposite order will set a different quick marker
~Xbutton1 & Xbutton2::
{
Send, ^2
return
}
; F22 is set to go to the first quick marker (button on my mouse (logitech g502))
F22::1
; F23 is set to go to the second quick marker (button on my mouse (logitech g502))
F23::2
; When F22 is pressed and held then F23 is pressed it will send the v key to houdini (shader radial menu) until F23 is released
F22 & F23::
{
Send, {v down}
keywait, F23
Send, {v up}
return
}
; When F23 is pressed and held then F22 is pressed it will send the c key to houdini (custom radial menu) until F22 is released
F23 & F22::
{
Send, {c down}
keywait, F22
Send, {c up}
return
}
; back is set to dive out of node
~Xbutton1::u
; back is set to dive into node
~Xbutton2::i
; disable windows u and windows i (this is for compatibility with the easy window dragging script)
#u::
#i::
return
; make F21 (button on mouse) send up twice then ctrl up on each sequential keypress (play, pause, rewind)
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
; make F24 (button on mouse) home the view on a single click or focus the view on a selected object on a double click
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

; This is the photoshop section
#IfWinActive,ahk_exe photoshop.exe
{
; Make F2 toggle between pressing alt + shift + r and alt + shift + n (changes between clear and normal brush modes in photoshop)
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

#s::
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
return

; Make windows + shift + s open snip and sketch tool and create a new snip
+#s::
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
return

; make win F1 F13, in displayfusion this puts the mouse cursor on the left most monitor
#F1::F13
