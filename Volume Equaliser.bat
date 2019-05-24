@ECHO OFF

ECHO Reset Volume Mixer Settings...

NET STOP Audiosrv
NET STOP AudioEndpointBuilder

REG DELETE "HKCU\Software\Microsoft\Internet Explorer\LowRegistry\Audio\PolicyConfig\PropertyStore" /F
REG ADD "HKCU\Software\Microsoft\Internet Explorer\LowRegistry\Audio\PolicyConfig\PropertyStore"

NET START Audiosrv

:: This resets windows volume mixer so that all applications are full volume.
:: I dont recommend having this run on startup as it takes a while to run and temporarily disables audio.
