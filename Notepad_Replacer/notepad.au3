#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=Ressources\Icon5.ico
#AutoIt3Wrapper_Outfile_x64=Executables\notepad.exe
#AutoIt3Wrapper_UseX64=y
#AutoIt3Wrapper_Res_Language=1036
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
;notepad.au3


#include <array.au3>

	Local $sNPPlus =  "C:\Program Files\Notepad++\notepad++.exe"

If $CmdLine[0] <> 0 Then
	Local $aParam =  $CmdLine[1]
	ShellExecute($sNPPlus, $aParam, "")
Else
	ShellExecute($sNPPlus, "")
EndIf
