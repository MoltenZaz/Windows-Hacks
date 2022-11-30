link := "https://sequematic.com/trigger-custom-webhook/274EC797FC/62710"
 
req := ComObjCreate("Msxml2.XMLHTTP")
req.open("GET", link, False)
req.Send()