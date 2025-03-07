; V1toV2: Removed #NoEnv
#Requires AutoHotkey v2.0
#SingleInstance force
Tray:= A_TrayMenu
A_MaxHotkeysPerInterval := 1000
SendMode("Input")  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir(A_ScriptDir)  ; Ensures a consistent starting directory.
SetKeyDelay(-1)

InstallKeybdHook()

; this script changes the layer of my qmk keyboard when entering games and for certain programs
; it requires your keyboard to use raw hid and it also uses hidapitester to send the codes to qmk
; hidapitester sends the number to qmk 1,1 for example and then qmk is preprogammed to know that 1,1 means turn off the gaming layer
; look through my keymap.c and the shortcut links in this repo if you want to learn more
SetNumLockState("AlwaysOn")

GroupAdd("Blacklist", "ahk_exe Shenzhen.exe")
GroupAdd("Blacklist", "ahk_exe retroarch.exe")
GroupAdd("Blacklist", "ahk_exe attract.exe")
GroupAdd("Blacklist", "ahk_exe picross.exe")
GroupAdd("Blacklist", "ahk_exe steamwebhelper.exe")
GroupAdd("Blacklist", "ahk_exe ES-DE.exe")
GroupAdd("Blacklist", "ahk_exe EliteDangerous64.exe")

; GroupAdd("Arrows", "ahk_exe TetrisEffect-Win64-Shipping.exe")
; GroupAdd("Arrows", "ahk_exe Apotris.exe")
; GroupAdd("Arrows", "ahk_exe celeste.exe")
; GroupAdd("Arrows", "ahk_exe RiftOfTheNecroDancer.exe")

NoEXESearch := ["steamwebhelper.exe", "explorer.exe", "notepad++.exe", "SearchApp.exe", "chrome.exe", "Discord.exe", "powershell.exe", "Taskmgr.exe", "cmd.exe"]
NoClassSearch := ["WorkerW", "Progman", "Windows.UI.Core.CoreWindow", "MozillaWindowClass"]
TraySetIcon("pifmgr.dll","13")

dcheck := 19
prev_id := ""

Loop
{
	checkfs:
	try
	{
		testing_id := WinGetProcessName("A")
		if (testing_id != prev_id)
		{
			dcheck := 19
			; SoundBeep 750
		}
		for each, word in NoEXESearch
		{
			if (testing_id == word)
			{
				WinWaitNotActive("ahk_exe " testing_id)
				testing_id := WinGetProcessName("A")
			}
		}
		active_class := WinGetClass("ahk_exe " testing_id)
		for each, word in NoClassSearch
		{
			if (active_class == word)
			{
				WinWaitNotActive("ahk_class " active_class)
				testing_id := WinGetProcessName("A")
			}
		}
		; SoundBeep
		isFullScreen := isWindowFullScreen("A")
		if (isFullScreen) {
			; SoundBeep 750
			{
				; SoundBeep 1500
				global active_id := testing_id
				If WinActive("ahk_exe " active_id)
				if !WinActive("ahk_group Blacklist")
				{	
					; SoundBeep 100
					Run("`"F:\Documents\AHK Current\Enter Gaming Elora.lnk`" hide")
					}
				; also arrow keys list
				; if WinActive("ahk_group Arrows")
				; {
					; SoundBeep 2000
					; Run("`"F:\Documents\AHK Current\Enter Arrows Elora.lnk`" hide")
				; }
				SetTimer(LoseFocus,100)
				WinWaitClose("ahk_exe " active_id)
				Goto checkfs
			}
		}
		else
		{
			if dcheck > 0
			{
				dcheck--
				Sleep 500
				prev_id := testing_id
				Goto checkfs
			}
		}
	} catch {
			WinWaitNotActive("A")
			dcheck := 19
			Goto checkfs
	}
	WinWaitNotActive("ahk_exe " testing_id)
	dcheck := 19
}

; ──────────────────────────────────────────── FULLSCREEN CHECKER ────────────────────────────────────────────

isWindowFullScreen(winTitle) {
    winID := WinExist(winTitle)
    if (!winID)
        return false

    try {
        style := WinGetStyle(winID)
        WinGetPos(, , &winW, &winH, winTitle)
    } catch {
        return false
    }
    
    ; 0x800000 is WS_BORDER.
    ; 0x20000000 is WS_MINIMIZE.
    ; No border and not minimized
    return ((style & 0x20800000) or winH < A_ScreenHeight or winW < A_ScreenWidth) ? false : true
}

; #HotIf WinActive("ahk_exe steamwebhelper.exe", )
; ~LButton::
; {
; ; msgbox, %dcheck%
; dcheck := 0
; ; Sleep, 2000
; WinWaitNotActive("ahk_exe steamwebhelper.exe")
; dcheck := 19
; ; msgbox, %dcheck%
; return
; }
; #HotIf

LoseFocus() ;update and change to loop
{
SetTimer(LoseFocus,0)
Loop
{
	if WinExist("ahk_exe " active_id)
	{
		WinWaitNotActive("ahk_exe " active_id)
		Run("`"F:\Documents\AHK Current\Exit Gaming Elora.lnk`" hide")
		if !WinExist("ahk_exe " active_id)
			break
		; run "F:\Documents\AHK Current\Exit Gaming ID75.lnk" hide
		WinWaitActive("ahk_exe " active_id)
		if WinActive("ahk_group Blacklist")
			break
		Run("`"F:\Documents\AHK Current\Enter Gaming Elora.lnk`" hide")
		; if WinActive("ahk_group Arrows")
		; {
			; Run("`"F:\Documents\AHK Current\Enter Arrows Elora.lnk`" hide")
			; ; run "F:\Documents\AHK Current\Enter Arrows ID75.lnk" hide
		; }
		; run "F:\Documents\AHK Current\Enter Gaming ID75.lnk" hide
	}
	else
		break
}
return
}

F23::
{
	Send("{U+200B}")
	return
}

F14::
{ ; V1toV2: Added bracket
global ; V1toV2: Made function global
SendMessage(0x112, 0xF170, 2, , "Program Manager")
return
} ; V1toV2: Added Bracket before hotkey or Hotstring

F15::
{
while GetKeyState("F15", "P")
{
      MouseClick("WheelLeft", , , 1)
      Sleep(150)
}
return
}

F16::
{
while GetKeyState("F16", "P")
{
      MouseClick("WheelRight", , , 1)
      Sleep(150)
}
return
}

; #Space::return

NumpadClear::Down
; F1::F20

~#x::
{
link := "http://192.168.1.135:8123/api/webhook/-luNO5E7VsmbpGIAAfV0c5rHZ"
 
req := ComObject("Msxml2.XMLHTTP")
req.open("POST", link, False)
req.Send()
return
}

~Down & F13:: ; set sound to dac
{
link := "http://192.168.1.135:8123/api/webhook/-luNO5E7VsmbpGIAAfV0c5rHZ"
 
req := ComObject("Msxml2.XMLHTTP")
req.open("POST", link, False)
req.Send()
Run("`"F:\Documents\AHK Current\Nircmd\SoundVolumeView.exe`" /SetDefault `"Bedroom Nest Mini Stereo`"")
; run F:\Documents\Nircmd\nircmd.exe setdefaultsounddevice "Nest Mini" 1
Sleep(500)
SoundSetVolume(0)
Send("{Volume_Up}")
Send("{Volume_Down 50}")
Sleep(1000)
; run "F:\Documents\AHK Current\Nircmd\SoundVolumeView.exe" /SetVolume "Nest Mini" 1
Run("F:\Documents\Nircmd\nircmd.exe setdefaultsounddevice `"FiiO DAC-E10`" 1")
Run("F:\Documents\Nircmd\nircmd.exe setdefaultsounddevice `"FiiO DAC-E10`" 2")
Sleep(1000)
SoundSetVolume(38)
Sleep(100)
Send("{Volume_Up}")
return
}

~Up & F13:: ; set sound to nest
{
Run("`"F:\Documents\AHK Current\Nircmd\SoundVolumeView.exe`" /SetDefault `"Bedroom Nest Mini Stereo`"")
; run F:\Documents\Nircmd\nircmd.exe setdefaultsounddevice "Nest Mini"
return
}

F13:: ; light toggle
{
link := "http://192.168.1.135:8123/api/webhook/bedroom-shelly-on-off-Xcvblgf9St8B74w7wxUdrH2s"
 
req := ComObject("Msxml2.XMLHTTP")
req.open("POST", link, False)
req.Send()
return
}

^F13:: ; desk toggle
{
link := "http://192.168.1.135:8123/api/webhook/-uh66rX3WTA-uVLp-keEhMCXl"
 
req := ComObject("Msxml2.XMLHTTP")
req.open("POST", link, False)
req.Send()
return
}

!F13:: ; window toggle
{
link := "http://192.168.1.135:8123/api/webhook/-ZruvR0CI7B7qjT4QZ_d4_q0z"
 
req := ComObject("Msxml2.XMLHTTP")
req.open("POST", link, False)
req.Send()
return
}

+F13:: ; bed toggle
{
link := "http://192.168.1.135:8123/api/webhook/-kRdYSRP_76MSVeWn81EL_5vB"
 
req := ComObject("Msxml2.XMLHTTP")
req.open("POST", link, False)
req.Send()
return
}

#F13:: ; door toggle
{
link := "http://192.168.1.135:8123/api/webhook/-um_OqOss-Xm0lMazNoK28w_V"
 
req := ComObject("Msxml2.XMLHTTP")
req.open("POST", link, False)
req.Send()
return
}

; ~Space & F13:: ; lamp toggle
; {
; link := "http://192.168.1.135:8123/api/webhook/-FvIdMrk6DcBbCX-WlXePdmYh"
 
; req := ComObject("Msxml2.XMLHTTP")
; req.open("POST", link, False)
; req.Send()
; return
; }

~Esc & F13:: ; max brightness and colour temp
{
link := "http://192.168.1.135:8123/api/webhook/-HoxvtKfkiX3vHvv2Je7f1Uni"
 
req := ComObject("Msxml2.XMLHTTP")
req.open("POST", link, False)
req.Send()
return
}

~Backspace & F13:: ; sleep mode
{
link := "http://192.168.1.135:8123/api/webhook/-ssXOar5koCxBm4idW5GkCwUi"
 
req := ComObject("Msxml2.XMLHTTP")
req.open("POST", link, False)
req.Send()
return
}

DetectHiddenWindows True

;; Get the handle
getSpotifyHwnd() {
	spotifyHwnd := WinGetID("ahk_exe Spotify.exe")
	Return spotifyHwnd
}

; Send a key, generic
spotifyKey(key) {
	spotifyHwnd := getSpotifyHwnd()
	; Chromium ignores keys when it isn't focused.
	; Focus the document window without bringing the app to the foreground.
	ControlFocus "Chrome_RenderWidgetHostHWND1", "ahk_id " . spotifyHwnd
	ControlSend key, , "ahk_id " . spotifyHwnd
	Return
}

^Media_Play_Pause::
{
	if WinExist("ahk_exe Spotify.exe")
	{
		spotifyKey("{Space}")
		Return
	}
	else
	{
		Run("`"C:\Users\mkenn\AppData\Roaming\Spotify\Spotify.exe`"")
	}
	return
}

^Media_Prev::
{
	if WinExist("ahk_exe Spotify.exe")
	{
		spotifyKey("^{Left}")
		Return
	}
	else
	{
		Run("`"C:\Users\mkenn\AppData\Roaming\Spotify\Spotify.exe`"")
	}
	return
}

^Media_Next::
{
	if WinExist("ahk_exe Spotify.exe")
	{
		spotifyKey("^{Right}")
		Return
	}
	else
	{
		Run("`"C:\Users\mkenn\AppData\Roaming\Spotify\Spotify.exe`"")
	}
	return
}

#HotIf WinActive("ahk_exe StreetFighter6.exe", )
{
,::6
.::7
}
#HotIf

#HotIf WinActive("ahk_exe GGST-Win64-Shipping.exe", )
{
; Delete::w
Backspace::,
Esc::Backspace
; 3::.
; 4::.
; 1::m
; 2::,
; 9::`;
}
#HotIf

#HotIf WinActive("ahk_exe cadwin.exe", )
{
^+z::^y
}
#HotIf

class WinEventHook {
    __New(eventMin, eventMax, hookProc, options := '', idProcess := 0, idThread := 0, dwFlags := 0) {
        this.pCallback := CallbackCreate(hookProc, options, 7)
        this.hHook := DllCall('SetWinEventHook', 'UInt', eventMin, 'UInt', eventMax, 'Ptr', 0, 'Ptr', this.pCallback
                                               , 'UInt', idProcess, 'UInt', idThread, 'UInt', dwFlags, 'Ptr')
    }
    __Delete() {
        DllCall('UnhookWinEvent', 'Ptr', this.hHook)
        CallbackFree(this.pCallback)
    }
}
