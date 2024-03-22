#SingleInstance force
#NoTrayIcon
GroupAdd, NPMOD, ahk_exe acad.exe
GroupAdd, NPMOD, ahk_exe Revit.exe
GroupAdd, NPMOD, ahk_exe cadwin.exe
WinWaitClose, ahk_group NPMOD
run Creative Helper.ahk
ExitApp
