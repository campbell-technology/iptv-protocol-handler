@if (@CodeSection == @Batch) @then

:: batch portion

@echo off
setlocal

set "url=%1"

cscript /nologo /e:JScript "%~f0" "%url%"

goto :EOF

@end
// JScript portion

var urlToDecode = WSH.Arguments(0);
urlToDecode = String(urlToDecode);

// strip the URL scheme from the input (we use "cctv://" which is 7 chars)
// Also urldecode what's left
var networkStreamUri = decodeURIComponent(urlToDecode.substring(7));

// Launch VLC targeting the MRL passed from the browser
var oShell = WScript.CreateObject("WScript.Shell");
oShell.Run ("cmd /c \"C:\\Program Files\\VideoLAN\\VLC\\vlc.exe\" " + networkStreamUri, 0);
