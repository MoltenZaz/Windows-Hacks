﻿link := "https://sequematic.com/trigger-custom-webhook/274EC797FC/103362"
 
req := ComObjCreate("Msxml2.XMLHTTP")
req.open("GET", link, False)
req.Send()