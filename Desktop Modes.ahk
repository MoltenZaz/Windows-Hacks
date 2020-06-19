#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
Menu, Tray, Icon, shell32.dll, 35
DesktopCount    := 2 ; Windows starts with 2 desktops at boot
CurrentDesktop  := 1 ; Desktop count is 1-indexed (Microsoft numbers them this way)
;F1::AutoSwitchDesktop()

~^#Right::Gosub ~^#Left
~^#Left::
{
global CurrentDesktop, DesktopCount
   mapDesktopsFromRegistry()
   ;Msgbox, %CurrentDesktop% %DesktopCount%
   if (CurrentDesktop = 1)
   {
   SetWallpaper("C:\Work\Random Drawings\Wallpaper All 3 Alt.png")
   UnPinToTaskbar("F:\Documents\AHK Current\Wallpaper Virtual Desktop\Desktop 1\Steam Client Bootstrapper.lnk")
   Sleep, 10
   UnPinToTaskbar("F:\Documents\AHK Current\Wallpaper Virtual Desktop\Desktop 1\Discord.lnk")
   Sleep, 10
   UnPinToTaskbar("F:\Documents\AHK Current\Wallpaper Virtual Desktop\Desktop 1\Battle.net.lnk")
   Sleep, 10
   run syspin "F:\Documents\AHK Current\Wallpaper Virtual Desktop\Desktop 1\Houdini FX.lnk" c:"Pin to Taskbar"
   Sleep, 10
   run syspin "F:\Documents\AHK Current\Wallpaper Virtual Desktop\Desktop 1\Photoshop CC 2019.lnk" c:"Pin to Taskbar"
   }
   else
   {
   SetWallpaper("C:\Work\Random Drawings\Wallpaper All 3.png")
   UnPinToTaskbar("F:\Documents\AHK Current\Wallpaper Virtual Desktop\Desktop 1\Houdini FX.lnk")
   Sleep, 10
   UnPinToTaskbar("F:\Documents\AHK Current\Wallpaper Virtual Desktop\Desktop 1\Photoshop CC 2019.lnk")
   Sleep, 10
   run syspin "F:\Documents\AHK Current\Wallpaper Virtual Desktop\Desktop 1\Steam Client Bootstrapper.lnk" c:"Pin to Taskbar"
   Sleep, 10
   run syspin "F:\Documents\AHK Current\Wallpaper Virtual Desktop\Desktop 1\Discord.lnk" c:"Pin to Taskbar"
   Sleep, 100
   run syspin "F:\Documents\AHK Current\Wallpaper Virtual Desktop\Desktop 1\Battle.net.lnk" c:"Pin to Taskbar"
   }
   EnumAddress := RegisterCallback("EnumWindowsProcHide", "Fast")
	DllCall("EnumWindows", UInt, EnumAddress, UInt, 0)
	;MsgBox, The following windows were hidden `n%Output%. Click OK to show them.
	WinShow, ahk_group HiddenWindows

	EnumWindowsProcHide(hwnd, lParam)
	{
    global Output
	DetectHiddenWindows, Off
    WinGetTitle, title, ahk_id %hwnd%
    WinGetClass, class, ahk_id %hwnd%
    if ((title)or(class="Shell_TrayWnd"))
    {
        Output .= "Title: " . title . "`tClass: " . class . "`n"
        WinHide, %title% ahk_class %class%
	GroupAdd, HiddenWindows, ahk_id %hwnd%
    }
    return true  ; Tell EnumWindows() to continue until all windows have been enumerated.
}
   return
}

SetWallpaper(BMPpath)
{
  SPI_SETDESKWALLPAPER := 20
  SPIF_SENDWININICHANGE := 2  
Return DllCall("SystemParametersInfo", UINT, SPI_SETDESKWALLPAPER, UINT, uiParam, STR, BMPpath, UINT, SPIF_SENDWININICHANGE)
}

; F1::UnPinToTaskbar("F:\Documents\AHK Current\Wallpaper Virtual Desktop\Desktop 1\steam.lnk")

; F2::run syspin "F:\Documents\AHK Current\Wallpaper Virtual Desktop\Desktop 1\steam.lnk" c:"Pin to Taskbar"

UnPinToTaskbar(FilePath)
{
    SplitPath,FilePath,File,Dir
    For i in ComObjCreate("Shell.Application").Namespace(Dir).ParseName(File).Verbs()
        if (i.Name = "Unpin from Tas&kbar")
            return i.DoIt()
}

mapDesktopsFromRegistry() {
   global CurrentDesktop, DesktopCount
   IdLength := 32
   SessionId := getSessionId()
   if (SessionId) {
      RegRead, CurrentDesktopId, HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\SessionInfo\%SessionId%\VirtualDesktops, CurrentVirtualDesktop
      if (CurrentDesktopId) {
         IdLength := StrLen(CurrentDesktopId)
      }
   }
   RegRead, DesktopList, HKEY_CURRENT_USER, SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VirtualDesktops, VirtualDesktopIDs
   if (DesktopList) {
       DesktopListLength := StrLen(DesktopList)
       DesktopCount := DesktopListLength / IdLength
   } else {
      DesktopCount := 1
   }
   i := 0
   while (CurrentDesktopId and i < DesktopCount) {
      StartPos := (i * IdLength) + 1
      DesktopIter := SubStr(DesktopList, StartPos, IdLength)
      if (DesktopIter = CurrentDesktopId) {
         CurrentDesktop := i + 1
         OutputDebug, Current desktop number is %CurrentDesktop% with an ID of %DesktopIter%.
         break
      }
      i++
   }
}
getSessionId() {
   ProcessId := DllCall("GetCurrentProcessId", "UInt")
   if ErrorLevel {
      MsgBox, % "Error getting current process id: " ErrorLevel
      return
   }
   DllCall("ProcessIdToSessionId", "UInt", ProcessId, "UInt*", SessionId)
   if ErrorLevel {
      MsgBox, % "Error getting session id: " ErrorLevel
      return
   }
   return SessionId
}

switchDesktopByNumber(targetDesktop) {
   global CurrentDesktop, DesktopCount
   mapDesktopsFromRegistry()
   if (targetDesktop > DesktopCount || targetDesktop < 1) {
      return
   }
   while(CurrentDesktop < targetDesktop) {
      Send ^#{Right}
      CurrentDesktop++
   }
   while(CurrentDesktop > targetDesktop) {
      Send ^#{Left}
      CurrentDesktop--
   }
}

AutoSwitchDesktop() {
   global CurrentDesktop, DesktopCount
   if ++CurrentDesktop > DesktopCount
      CurrentDesktop := 1
   switchDesktopByNumber(CurrentDesktop)  
}