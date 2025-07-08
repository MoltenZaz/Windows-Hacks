#Requires AutoHotkey v2.0
TraySetIcon("pifmgr.dll","13")

#HotIf (WinActive("ahk_exe cadwin.exe"))
{
	F13::Send "{!}textedit{enter}"
	F14::Send "{!}textchange case upper ok{enter}"
	F15::Send "{!}reference{enter}"
	F16::Send "{!}snapmid{enter}"
	F17::Send "{!}cpllock{enter}"
	; F18::Send "{!}notassigned{enter}"
	; F19::Send "{!}notassigned{enter}"
	; F20::Send "{!}notassigned{enter}"
	; F21::Send "{!}notassigned{enter}"
	; F22::Send "{!}notassigned{enter}"
	; F23::Send "{!}notassigned{enter}"
	; F24::Send "{!}notassigned{enter}"
	^+s::Send "{!}saveas{enter}"
	^!s::Send "{!}saveall{enter}"
	^+z::^y
	^Backspace::Send "{ctrl down}{shift down}{left}{shift up}{ctrl up}{backspace}"
}
#HotIf

#HotIf (WinActive("ahk_exe explorer.exe"))
{
	^Backspace::Send "{ctrl down}{shift down}{left}{shift up}{ctrl up}{backspace}"
}
#HotIf

#HotIf WinActive("ahk_exe cadwin.exe") && IsControlActive("CaddsmanWindowClass1", "ahk_exe cadwin.exe") ; ControlGetClassNN(ControlGetFocus("ahk_exe cadwin.exe")) = "CaddsmanWindowClass1"
{
	Left::^Left
	Right::^Right
	Up::^Up
	Down::^Down
	+Left::^+Left
	+Right::^+Right
	+Up::^+Up
	+Down::^+Down
	XButton1::Send "{!}reference{enter}"
	XButton2::Send "{!}snapmid{enter}"
}
#HotIf

IsControlActive(classNN, winTitle) => (hWnd := WinExist(winTitle)) && WinActive(hWnd) && (focusedCtrl := ControlGetFocus(hWnd)) && ControlGetClassNN(focusedCtrl) = classNN
