; This script requires the Acc.ahk standard library. You can get it (and this script) from the link below.
; https://gist.github.com/vaindil/a223fe82ec2122e02bf0062c82a20186
;#Include "F:\Documents\AHK Current\YoutubeHelper.ahk"
Menu, Tray, Icon, shell32.dll, 138

SetTitleMatchMode, 2
skipVAR = 0
#NoEnv
Coordmode, Mouse, Screen
#include WinGetPosEx.ahk
#SingleInstance force
#MaxHotkeysPerInterval 1000
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetKeyDelay, -1

^Insert::Suspend

;~AppsKey & ~Pause::Reload

!Media_Play_Pause::
{
ControlSend, ahk_parent, {space}, ahk_class Qt5QWindowIcon
return
}

~!Insert::
{
SetTimer, Refresh, 60000
return
}

Refresh:
{
Reload
return
}
~XButton2 & MButton::Media_Play_Pause

~XButton2 & F15::Media_Prev
~XButton2 & F16::Media_Next

#IfWinNotExist, ahk_exe Spotify.exe
{
~XButton2 & F15::Gosub Media_Prev
~XButton2 & F16::Gosub Media_Next
~XButton2 & MButton::Gosub Media_Play_Pause
Media_Next::
{
; Loop, Parse, Tabs, `n
  ; {
    ; If (RegexMatch(A_LoopField, ".*\- YouTube")) {
      ; TabName := A_LoopField
      ; break
    ; }
  ; }
; WinGet FF, ID, ahk_exe firefox.exe
  ; Tabs := JEE_FirefoxGetTabNames(FF)
  ; WinGetTitle, CurrentTitle, ahk_id %FF%
  ; SubstrPos := InStr(CurrentTitle, " - Firefox Developer Edition")
  ; ;CurrentTitle := SubStr(CurrentTitle, 1, SubstrPos - 1)
  ; TabName = ""
  ; IfInString, CurrentTitle, YouTube
  ; {
  ; ControlSend, ahk_parent, {Shift down}n{Shift up}, ahk_class MozillaWindowClass
  ; }
; return
WinGet FF, ID, ahk_exe firefox.exe
  Tabs := JEE_FirefoxGetTabNames(FF)
  WinGetTitle, CurrentTitle, ahk_id %FF%
  SubstrPos := InStr(CurrentTitle, " - Firefox Developer Edition")
  ;CurrentTitle := SubStr(CurrentTitle, 1, SubstrPos - 1)
  TabName = ""

  Loop, Parse, Tabs, `n
  {
    If (RegexMatch(A_LoopField, ".*\- YouTube")) 
	{
      TabName := A_LoopField
      break
    }
  }
  If (TabName = "") 
  {
    return
  }
  JEE_FirefoxFocusTabByName(FF, TabName)
  IfInString, CurrentTitle, YouTube
  {
	ControlSend, ahk_parent, {Shift down}n{Shift up}, ahk_class MozillaWindowClass
  }
  else
  {
	  ;ControlSend, ahk_parent, {Ctrl Down}{t}{Ctrl Up}, ahk_class MozillaWindowClass
	  ;ControlSend, ahk_parent, {Ctrl Down}{w}{Ctrl Up}, ahk_class MozillaWindowClass
	  ;ControlSend, ahk_parent, {Ctrl Down}{Shift Down}{o}{Shift Up}{Ctrl Up}, ahk_class MozillaWindowClass
	  ;Sleep, 500
	  ;ControlSend, ahk_parent, {Media_Play_Pause}, ahk_class MozillaWindowClass
	  ;ControlSend, ahk_parent, {F11}, ahk_class MozillaWindowClass
	  ;Sleep, 100
	  ;ControlSend, ahk_parent, {F11}, ahk_class MozillaWindowClass
	  ;Sleep, 100
	  ControlSend, ahk_parent, {Shift down}n{Shift up}, ahk_class MozillaWindowClass
	  ControlSend, ahk_parent, {Alt Down}{Shift Down}{Left}{Shift Up}{Alt Up}, ahk_class MozillaWindowClass
	  ;Send, {Media_Play_Pause}
  }
  return
}

Media_Prev::
{
; Loop, Parse, Tabs, `n
  ; {
    ; If (RegexMatch(A_LoopField, ".*\- YouTube")) {
      ; TabName := A_LoopField
      ; break
    ; }
  ; }
; WinGet FF, ID, ahk_exe firefox.exe
  ; Tabs := JEE_FirefoxGetTabNames(FF)
  ; WinGetTitle, CurrentTitle, ahk_id %FF%
  ; SubstrPos := InStr(CurrentTitle, " - Firefox Developer Edition")
  ; ;CurrentTitle := SubStr(CurrentTitle, 1, SubstrPos - 1)
  ; TabName = ""
  ; IfInString, CurrentTitle, YouTube
  ; {
  ; ControlSend, ahk_parent, {Shift down}n{Shift up}, ahk_class MozillaWindowClass
  ; }
; return
WinGet FF, ID, ahk_exe firefox.exe
  Tabs := JEE_FirefoxGetTabNames(FF)
  WinGetTitle, CurrentTitle, ahk_id %FF%
  SubstrPos := InStr(CurrentTitle, " - Firefox Developer Edition")
  ;CurrentTitle := SubStr(CurrentTitle, 1, SubstrPos - 1)
  TabName = ""

  Loop, Parse, Tabs, `n
  {
    If (RegexMatch(A_LoopField, ".*\- YouTube")) 
	{
      TabName := A_LoopField
      break
    }
  }
  If (TabName = "") 
  {
    return
  }
  JEE_FirefoxFocusTabByName(FF, TabName)
  IfInString, CurrentTitle, YouTube
  {
	ControlSend, ahk_parent, {Alt down}{Left}{Alt up}, ahk_class MozillaWindowClass
  }
  else
  {
	  ;ControlSend, ahk_parent, {Ctrl Down}{t}{Ctrl Up}, ahk_class MozillaWindowClass
	  ;ControlSend, ahk_parent, {Ctrl Down}{w}{Ctrl Up}, ahk_class MozillaWindowClass
	  ;ControlSend, ahk_parent, {Ctrl Down}{Shift Down}{o}{Shift Up}{Ctrl Up}, ahk_class MozillaWindowClass
	  ;Sleep, 500
	  ;ControlSend, ahk_parent, {Media_Play_Pause}, ahk_class MozillaWindowClass
	  ;ControlSend, ahk_parent, {F11}, ahk_class MozillaWindowClass
	  ;Sleep, 100
	  ;ControlSend, ahk_parent, {F11}, ahk_class MozillaWindowClass
	  ;Sleep, 100
	  ControlSend, ahk_parent, {Alt down}{Left}{Alt up}, ahk_class MozillaWindowClass
	  ControlSend, ahk_parent, {Alt Down}{Shift Down}{Left}{Shift Up}{Alt Up}, ahk_class MozillaWindowClass
	  ;Send, {Media_Play_Pause}
  }
  return
}

Media_Play_Pause::
{
#InstallKeybdHook
KeyWait, Media_Play_Pause, T0.5 L
If errorlevel=1
{
ControlSend, ahk_parent, {F11}, ahk_class MozillaWindowClass
Sleep, 1
ControlSend, ahk_parent, {F11}, ahk_class MozillaWindowClass
Sleep, 1
HandleKey("Media_Play_Pause", 0)
}
else
{
HandleKey("Media_Play_Pause", 0)
}
return
}
}
#if

~Appskey & Media_Next::
{
; Loop, Parse, Tabs, `n
  ; {
    ; If (RegexMatch(A_LoopField, ".*\- YouTube")) {
      ; TabName := A_LoopField
      ; break
    ; }
  ; }
; WinGet FF, ID, ahk_exe firefox.exe
  ; Tabs := JEE_FirefoxGetTabNames(FF)
  ; WinGetTitle, CurrentTitle, ahk_id %FF%
  ; SubstrPos := InStr(CurrentTitle, " - Firefox Developer Edition")
  ; ;CurrentTitle := SubStr(CurrentTitle, 1, SubstrPos - 1)
  ; TabName = ""
  ; IfInString, CurrentTitle, YouTube
  ; {
  ; ControlSend, ahk_parent, {Shift down}n{Shift up}, ahk_class MozillaWindowClass
  ; }
; return
WinGet FF, ID, ahk_exe firefox.exe
  Tabs := JEE_FirefoxGetTabNames(FF)
  WinGetTitle, CurrentTitle, ahk_id %FF%
  SubstrPos := InStr(CurrentTitle, " - Firefox Developer Edition")
  ;CurrentTitle := SubStr(CurrentTitle, 1, SubstrPos - 1)
  TabName = ""

  Loop, Parse, Tabs, `n
  {
    If (RegexMatch(A_LoopField, ".*\- YouTube")) 
	{
      TabName := A_LoopField
      break
    }
  }
  If (TabName = "") 
  {
    return
  }
  JEE_FirefoxFocusTabByName(FF, TabName)
  IfInString, CurrentTitle, YouTube
  {
	ControlSend, ahk_parent, {Shift down}n{Shift up}, ahk_class MozillaWindowClass
  }
  else
  {
	  ;ControlSend, ahk_parent, {Ctrl Down}{t}{Ctrl Up}, ahk_class MozillaWindowClass
	  ;ControlSend, ahk_parent, {Ctrl Down}{w}{Ctrl Up}, ahk_class MozillaWindowClass
	  ;ControlSend, ahk_parent, {Ctrl Down}{Shift Down}{o}{Shift Up}{Ctrl Up}, ahk_class MozillaWindowClass
	  ;Sleep, 500
	  ;ControlSend, ahk_parent, {Media_Play_Pause}, ahk_class MozillaWindowClass
	  ;ControlSend, ahk_parent, {F11}, ahk_class MozillaWindowClass
	  ;Sleep, 100
	  ;ControlSend, ahk_parent, {F11}, ahk_class MozillaWindowClass
	  ;Sleep, 100
	  ControlSend, ahk_parent, {Ctrl up}, ahk_class MozillaWindowClass
	  ControlSend, ahk_parent, {Shift down}n{Shift up}, ahk_class MozillaWindowClass
	  ControlSend, ahk_parent, {Alt Down}{Shift Down}{Left}{Shift Up}{Alt Up}, ahk_class MozillaWindowClass
	  ;Send, {Media_Play_Pause}
  }
  return
}

AppsKey & Media_Prev::
{
; Loop, Parse, Tabs, `n
  ; {
    ; If (RegexMatch(A_LoopField, ".*\- YouTube")) {
      ; TabName := A_LoopField
      ; break
    ; }
  ; }
; WinGet FF, ID, ahk_exe firefox.exe
  ; Tabs := JEE_FirefoxGetTabNames(FF)
  ; WinGetTitle, CurrentTitle, ahk_id %FF%
  ; SubstrPos := InStr(CurrentTitle, " - Firefox Developer Edition")
  ; ;CurrentTitle := SubStr(CurrentTitle, 1, SubstrPos - 1)
  ; TabName = ""
  ; IfInString, CurrentTitle, YouTube
  ; {
  ; ControlSend, ahk_parent, {Shift down}n{Shift up}, ahk_class MozillaWindowClass
  ; }
; return
WinGet FF, ID, ahk_exe firefox.exe
  Tabs := JEE_FirefoxGetTabNames(FF)
  WinGetTitle, CurrentTitle, ahk_id %FF%
  SubstrPos := InStr(CurrentTitle, " - Firefox Developer Edition")
  ;CurrentTitle := SubStr(CurrentTitle, 1, SubstrPos - 1)
  TabName = ""

  Loop, Parse, Tabs, `n
  {
    If (RegexMatch(A_LoopField, ".*\- YouTube")) 
	{
      TabName := A_LoopField
      break
    }
  }
  If (TabName = "") 
  {
    return
  }
  JEE_FirefoxFocusTabByName(FF, TabName)
  IfInString, CurrentTitle, YouTube
  {
	ControlSend, ahk_parent, {Shift down}p{Shift up}, ahk_class MozillaWindowClass
  }
  else
  {
	  ;ControlSend, ahk_parent, {Ctrl Down}{t}{Ctrl Up}, ahk_class MozillaWindowClass
	  ;ControlSend, ahk_parent, {Ctrl Down}{w}{Ctrl Up}, ahk_class MozillaWindowClass
	  ;ControlSend, ahk_parent, {Ctrl Down}{Shift Down}{o}{Shift Up}{Ctrl Up}, ahk_class MozillaWindowClass
	  ;Sleep, 500
	  ;ControlSend, ahk_parent, {Media_Play_Pause}, ahk_class MozillaWindowClass
	  ;ControlSend, ahk_parent, {F11}, ahk_class MozillaWindowClass
	  ;Sleep, 100
	  ;ControlSend, ahk_parent, {F11}, ahk_class MozillaWindowClass
	  ;Sleep, 100
	  ControlSend, ahk_parent, {Shift down}p{Shift up}, ahk_class MozillaWindowClass
	  ControlSend, ahk_parent, {Alt Down}{Shift Down}{Left}{Shift Up}{Alt Up}, ahk_class MozillaWindowClass
	  ;Send, {Media_Play_Pause}
  }
  return
}

~Appskey & Media_Play_Pause::
{
#InstallKeybdHook
KeyWait, Media_Play_Pause, T0.5 L
If errorlevel=1
{
ControlSend, ahk_parent, {F11}, ahk_class MozillaWindowClass
Sleep, 1
ControlSend, ahk_parent, {F11}, ahk_class MozillaWindowClass
Sleep, 1
HandleKey("Media_Play_Pause", 0)
}
else
{
HandleKey("Media_Play_Pause", 0)
}
return
}

; Media_Prev::
  ; HandleKey("0")
  ; return

; Media_Next::
  ; HandleKey("N")
  ; return

HandleKey(Key, skipVAR) {
  WinGet FF, ID, ahk_exe firefox.exe
  Tabs := JEE_FirefoxGetTabNames(FF)
  WinGetTitle, CurrentTitle, ahk_id %FF%
  SubstrPos := InStr(CurrentTitle, " - Firefox Developer Edition")
  ;CurrentTitle := SubStr(CurrentTitle, 1, SubstrPos - 1)
  TabName = ""

  Loop, Parse, Tabs, `n
  {
    If (RegexMatch(A_LoopField, ".*\- YouTube")) {
      TabName := A_LoopField
      break
    }
  }

  If (TabName = "") {
    return
  }
  IfInString, CurrentTitle, VFX_HXFD
  {
  ;ControlSend, ahk_parent, {Ctrl Down}{Shift Down}{o}{Shift Up}{Ctrl Up}, ahk_class MozillaWindowClass
  ControlSend, ahk_parent, {space}, ahk_class MozillaWindowClass
  ;ControlSend, ahk_parent, {Media_Play_Pause}, ahk_class MozillaWindowClass
  return
  }
  IfInString, CurrentTitle, Twitch
  {
  ;ControlSend, ahk_parent, {Ctrl Down}{Shift Down}{o}{Shift Up}{Ctrl Up}, ahk_class MozillaWindowClass
  ControlSend, ahk_parent, k, ahk_class MozillaWindowClass
  ;ControlSend, ahk_parent, {Media_Play_Pause}, ahk_class MozillaWindowClass
  }
  else
  {
  IfInString, CurrentTitle, Prime Video
  {
  ;ControlSend, ahk_parent, {Ctrl Down}{Shift Down}{o}{Shift Up}{Ctrl Up}, ahk_class MozillaWindowClass
  ControlSend, ahk_parent, {space}, ahk_class MozillaWindowClass
  ;ControlSend, ahk_parent, {Media_Play_Pause}, ahk_class MozillaWindowClass
  }
  else
  {
  IfInString, CurrentTitle, Netflix
  {
  ;ControlSend, ahk_parent, {Ctrl Down}{Shift Down}{o}{Shift Up}{Ctrl Up}, ahk_class MozillaWindowClass
  ControlSend, ahk_parent, {Ctrl up}, ahk_class MozillaWindowClass
  ControlSend, ahk_parent, k, ahk_class MozillaWindowClass
  ;ControlSend, ahk_parent, {Media_Play_Pause}, ahk_class MozillaWindowClass
  }
  else
  {
  JEE_FirefoxFocusTabByName(FF, TabName)
  IfInString, CurrentTitle, YouTube
  {
  ;ControlSend, ahk_parent, {Ctrl Down}{Shift Down}{o}{Shift Up}{Ctrl Up}, ahk_class MozillaWindowClass
  ControlSend, ahk_parent, k, ahk_class MozillaWindowClass
  ;ControlSend, ahk_parent, {Media_Play_Pause}, ahk_class MozillaWindowClass
  }
  else
  {
  if (skipVAR = 0)
  {
  ;ControlSend, ahk_parent, {Ctrl Down}{t}{Ctrl Up}, ahk_class MozillaWindowClass
  ;ControlSend, ahk_parent, {Ctrl Down}{w}{Ctrl Up}, ahk_class MozillaWindowClass
  ;ControlSend, ahk_parent, {Ctrl Down}{Shift Down}{o}{Shift Up}{Ctrl Up}, ahk_class MozillaWindowClass
  ;Sleep, 500
  ;ControlSend, ahk_parent, {Media_Play_Pause}, ahk_class MozillaWindowClass
  ;ControlSend, ahk_parent, {F11}, ahk_class MozillaWindowClass
  ;Sleep, 100
  ;ControlSend, ahk_parent, {F11}, ahk_class MozillaWindowClass
  ;Sleep, 100
  ControlSend, ahk_parent, k, ahk_class MozillaWindowClass
  ControlSend, ahk_parent, {Alt Down}{Shift Down}{Left}{Shift Up}{Alt Up}, ahk_class MozillaWindowClass
  ;Send, {Media_Play_Pause}
  }
  else
  {
  ;ControlSend, ahk_parent, {Ctrl Down}{t}{Ctrl Up}, ahk_class MozillaWindowClass
  ;ControlSend, ahk_parent, {Ctrl Down}{w}{Ctrl Up}, ahk_class MozillaWindowClass
  ;ControlSend, ahk_parent, {Ctrl Down}{Shift Down}{o}{Shift Up}{Ctrl Up}, ahk_class MozillaWindowClass
  ;ControlSend, ahk_parent, {F11}, ahk_class MozillaWindowClass
  ;Sleep, 100
  ;ControlSend, ahk_parent, {F11}, ahk_class MozillaWindowClass
  ;Sleep, 100
  ControlSend, ahk_parent, k, ahk_class MozillaWindowClass
  ;Send, {Media_Play_Pause}
  }
  ;msgbox, %CurrentTitle%
  }
  ;JEE_FirefoxFocusTabByName(FF, CurrentTitle)
  }
  }
  }
  }
; ; https://autohotkey.com/boards/viewtopic.php?f=6&t=26947&p=139114#p139114

JEE_FirefoxGetTabNames(hWnd, vSep:="`n")
{
  oAcc := Acc_Get("Object", "4", 0, "ahk_id " hWnd)
  vRet := 0
  for _, oChild in Acc_Children(oAcc)
    if (oChild.accName(0) == "Browser tabs")
    {
      oAcc := Acc_Children(oChild)[1], vRet := 1
      break
    }
  if !vRet
  {
    oAcc := oChild := ""
    return
  }

  vOutput := ""
  for _, oChild in Acc_Children(oAcc)
  {
    vTabText := oChild.accName(0)
    if !(vTabText == "")
    ;&& !(vTabText == "New Tab")
    ;&& !(vTabText == "Open a new tab")
      vOutput .= vTabText vSep
  }
  vOutput := SubStr(vOutput, 1, -StrLen(vSep)) ;trim right
  oAcc := oChild := ""
  return vOutput
}

JEE_FirefoxFocusTabByName(hWnd, vTitle, vNum:=1)
{
  oAcc := Acc_Get("Object", "4", 0, "ahk_id " hWnd)
  vRet := 0
  for _, oChild in Acc_Children(oAcc)
    if (oChild.accName(0) == "Browser tabs")
    {
      oAcc := Acc_Children(oChild)[1], vRet := 1
      break
    }
  if !vRet
  {
    oAcc := oChild := ""
    return
  }

  vCount := 0, vRet := 0
  for _, oChild in Acc_Children(oAcc)
  {
    vTabText := oChild.accName(0)
    if (vTabText = vTitle)
      vCount++
    if (vCount = vNum)
    {
      oChild.accDoDefaultAction(0), vRet := A_Index
      break
    }
  }
  oAcc := oChild := ""
  return vRet
}









; http://www.autohotkey.com/board/topic/77303-acc-library-ahk-l-updated-09272012/
; https://dl.dropbox.com/u/47573473/Web%20Server/AHK_L/Acc.ahk
;------------------------------------------------------------------------------
; Acc.ahk Standard Library
; by Sean
; Updated by jethrow:
; 	Modified ComObjEnwrap params from (9,pacc) --> (9,pacc,1)
; 	Changed ComObjUnwrap to ComObjValue in order to avoid AddRef (thanks fincs)
; 	Added Acc_GetRoleText & Acc_GetStateText
; 	Added additional functions - commented below
; 	Removed original Acc_Children function
; last updated 2/25/2010
;------------------------------------------------------------------------------

Acc_Init()
{
	Static	h
	If Not	h
		h:=DllCall("LoadLibrary","Str","oleacc","Ptr")
}
Acc_ObjectFromEvent(ByRef _idChild_, hWnd, idObject, idChild)
{
	Acc_Init()
	If	DllCall("oleacc\AccessibleObjectFromEvent", "Ptr", hWnd, "UInt", idObject, "UInt", idChild, "Ptr*", pacc, "Ptr", VarSetCapacity(varChild,8+2*A_PtrSize,0)*0+&varChild)=0
	Return	ComObjEnwrap(9,pacc,1), _idChild_:=NumGet(varChild,8,"UInt")
}

Acc_ObjectFromPoint(ByRef _idChild_ = "", x = "", y = "")
{
	Acc_Init()
	If	DllCall("oleacc\AccessibleObjectFromPoint", "Int64", x==""||y==""?0*DllCall("GetCursorPos","Int64*",pt)+pt:x&0xFFFFFFFF|y<<32, "Ptr*", pacc, "Ptr", VarSetCapacity(varChild,8+2*A_PtrSize,0)*0+&varChild)=0
	Return	ComObjEnwrap(9,pacc,1), _idChild_:=NumGet(varChild,8,"UInt")
}

Acc_ObjectFromWindow(hWnd, idObject = -4)
{
	Acc_Init()
	If	DllCall("oleacc\AccessibleObjectFromWindow", "Ptr", hWnd, "UInt", idObject&=0xFFFFFFFF, "Ptr", -VarSetCapacity(IID,16)+NumPut(idObject==0xFFFFFFF0?0x46000000000000C0:0x719B3800AA000C81,NumPut(idObject==0xFFFFFFF0?0x0000000000020400:0x11CF3C3D618736E0,IID,"Int64"),"Int64"), "Ptr*", pacc)=0
	Return	ComObjEnwrap(9,pacc,1)
}

Acc_WindowFromObject(pacc)
{
	If	DllCall("oleacc\WindowFromAccessibleObject", "Ptr", IsObject(pacc)?ComObjValue(pacc):pacc, "Ptr*", hWnd)=0
	Return	hWnd
}

Acc_GetRoleText(nRole)
{
	nSize := DllCall("oleacc\GetRoleText", "Uint", nRole, "Ptr", 0, "Uint", 0)
	VarSetCapacity(sRole, (A_IsUnicode?2:1)*nSize)
	DllCall("oleacc\GetRoleText", "Uint", nRole, "str", sRole, "Uint", nSize+1)
	Return	sRole
}

Acc_GetStateText(nState)
{
	nSize := DllCall("oleacc\GetStateText", "Uint", nState, "Ptr", 0, "Uint", 0)
	VarSetCapacity(sState, (A_IsUnicode?2:1)*nSize)
	DllCall("oleacc\GetStateText", "Uint", nState, "str", sState, "Uint", nSize+1)
	Return	sState
}

Acc_SetWinEventHook(eventMin, eventMax, pCallback)
{
	Return	DllCall("SetWinEventHook", "Uint", eventMin, "Uint", eventMax, "Uint", 0, "Ptr", pCallback, "Uint", 0, "Uint", 0, "Uint", 0)
}

Acc_UnhookWinEvent(hHook)
{
	Return	DllCall("UnhookWinEvent", "Ptr", hHook)
}
/*	Win Events:

	pCallback := RegisterCallback("WinEventProc")
	WinEventProc(hHook, event, hWnd, idObject, idChild, eventThread, eventTime)
	{
		Critical
		Acc := Acc_ObjectFromEvent(_idChild_, hWnd, idObject, idChild)
		; Code Here:

	}
*/

; Written by jethrow
Acc_Role(Acc, ChildId=0) {
	try return ComObjType(Acc,"Name")="IAccessible"?Acc_GetRoleText(Acc.accRole(ChildId)):"invalid object"
}
Acc_State(Acc, ChildId=0) {
	try return ComObjType(Acc,"Name")="IAccessible"?Acc_GetStateText(Acc.accState(ChildId)):"invalid object"
}
Acc_Location(Acc, ChildId=0, byref Position="") { ; adapted from Sean's code
	try Acc.accLocation(ComObj(0x4003,&x:=0), ComObj(0x4003,&y:=0), ComObj(0x4003,&w:=0), ComObj(0x4003,&h:=0), ChildId)
	catch
		return
	Position := "x" NumGet(x,0,"int") " y" NumGet(y,0,"int") " w" NumGet(w,0,"int") " h" NumGet(h,0,"int")
	return	{x:NumGet(x,0,"int"), y:NumGet(y,0,"int"), w:NumGet(w,0,"int"), h:NumGet(h,0,"int")}
}
Acc_Parent(Acc) { 
	try parent:=Acc.accParent
	return parent?Acc_Query(parent):
}
Acc_Child(Acc, ChildId=0) {
	try child:=Acc.accChild(ChildId)
	return child?Acc_Query(child):
}
Acc_Query(Acc) { ; thanks Lexikos - www.autohotkey.com/forum/viewtopic.php?t=81731&p=509530#509530
	try return ComObj(9, ComObjQuery(Acc,"{618736e0-3c3d-11cf-810c-00aa00389b71}"), 1)
}
Acc_Error(p="") {
	static setting:=0
	return p=""?setting:setting:=p
}
Acc_Children(Acc) {
	if ComObjType(Acc,"Name") != "IAccessible"
		ErrorLevel := "Invalid IAccessible Object"
	else {
		Acc_Init(), cChildren:=Acc.accChildCount, Children:=[]
		if DllCall("oleacc\AccessibleChildren", "Ptr",ComObjValue(Acc), "Int",0, "Int",cChildren, "Ptr",VarSetCapacity(varChildren,cChildren*(8+2*A_PtrSize),0)*0+&varChildren, "Int*",cChildren)=0 {
			Loop %cChildren%
				i:=(A_Index-1)*(A_PtrSize*2+8)+8, child:=NumGet(varChildren,i), Children.Insert(NumGet(varChildren,i-8)=9?Acc_Query(child):child), NumGet(varChildren,i-8)=9?ObjRelease(child):
			return Children.MaxIndex()?Children:
		} else
			ErrorLevel := "AccessibleChildren DllCall Failed"
	}
	if Acc_Error()
		throw Exception(ErrorLevel,-1)
}
Acc_ChildrenByRole(Acc, Role) {
	if ComObjType(Acc,"Name")!="IAccessible"
		ErrorLevel := "Invalid IAccessible Object"
	else {
		Acc_Init(), cChildren:=Acc.accChildCount, Children:=[]
		if DllCall("oleacc\AccessibleChildren", "Ptr",ComObjValue(Acc), "Int",0, "Int",cChildren, "Ptr",VarSetCapacity(varChildren,cChildren*(8+2*A_PtrSize),0)*0+&varChildren, "Int*",cChildren)=0 {
			Loop %cChildren% {
				i:=(A_Index-1)*(A_PtrSize*2+8)+8, child:=NumGet(varChildren,i)
				if NumGet(varChildren,i-8)=9
					AccChild:=Acc_Query(child), ObjRelease(child), Acc_Role(AccChild)=Role?Children.Insert(AccChild):
				else
					Acc_Role(Acc, child)=Role?Children.Insert(child):
			}
			return Children.MaxIndex()?Children:, ErrorLevel:=0
		} else
			ErrorLevel := "AccessibleChildren DllCall Failed"
	}
	if Acc_Error()
		throw Exception(ErrorLevel,-1)
}
Acc_Get(Cmd, ChildPath="", ChildID=0, WinTitle="", WinText="", ExcludeTitle="", ExcludeText="") {
	static properties := {Action:"DefaultAction", DoAction:"DoDefaultAction", Keyboard:"KeyboardShortcut"}
	AccObj :=   IsObject(WinTitle)? WinTitle
			:   Acc_ObjectFromWindow( WinExist(WinTitle, WinText, ExcludeTitle, ExcludeText), 0 )
	if ComObjType(AccObj, "Name") != "IAccessible"
		ErrorLevel := "Could not access an IAccessible Object"
	else {
		StringReplace, ChildPath, ChildPath, _, %A_Space%, All
		AccError:=Acc_Error(), Acc_Error(true)
		Loop Parse, ChildPath, ., %A_Space%
			try {
				if A_LoopField is digit
					Children:=Acc_Children(AccObj), m2:=A_LoopField ; mimic "m2" output in else-statement
				else
					RegExMatch(A_LoopField, "(\D*)(\d*)", m), Children:=Acc_ChildrenByRole(AccObj, m1), m2:=(m2?m2:1)
				if Not Children.HasKey(m2)
					throw
				AccObj := Children[m2]
			} catch {
				ErrorLevel:="Cannot access ChildPath Item #" A_Index " -> " A_LoopField, Acc_Error(AccError)
				if Acc_Error()
					throw Exception("Cannot access ChildPath Item", -1, "Item #" A_Index " -> " A_LoopField)
				return
			}
		Acc_Error(AccError)
		StringReplace, Cmd, Cmd, %A_Space%, , All
		properties.HasKey(Cmd)? Cmd:=properties[Cmd]:
		try {
			if (Cmd = "Location")
				AccObj.accLocation(ComObj(0x4003,&x:=0), ComObj(0x4003,&y:=0), ComObj(0x4003,&w:=0), ComObj(0x4003,&h:=0), ChildId)
			  , ret_val := "x" NumGet(x,0,"int") " y" NumGet(y,0,"int") " w" NumGet(w,0,"int") " h" NumGet(h,0,"int")
			else if (Cmd = "Object")
				ret_val := AccObj
			else if Cmd in Role,State
				ret_val := Acc_%Cmd%(AccObj, ChildID+0)
			else if Cmd in ChildCount,Selection,Focus
				ret_val := AccObj["acc" Cmd]
			else
				ret_val := AccObj["acc" Cmd](ChildID+0)
		} catch {
			ErrorLevel := """" Cmd """ Cmd Not Implemented"
			if Acc_Error()
				throw Exception("Cmd Not Implemented", -1, Cmd)
			return
		}
		return ret_val, ErrorLevel:=0
	}
	if Acc_Error()
		throw Exception(ErrorLevel,-1)
}
