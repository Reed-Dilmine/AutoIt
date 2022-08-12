;NotePad_Replacer.au3

; #include <array.au3>

	Local $sNPPlus =  "C:\Program Files\Notepad++\notepad++.exe"

If $CmdLine[0] <> 0 Then
    #cs
		MsgBox(64, 'La ligne de paramètres envoyée aux programme est :', $CmdLineRaw)
		MsgBox(64, 'Le paramètre est : ', $CmdLine[1])
		Local $aParams = StringSplit($CmdLineRaw, " ")
		_ArrayDisplay($aParams, "Liste des paramètres")
	#ce
	Local $aParam = """" & $CmdLineRaw &  """"
	;   MsgBox(64, 'Le paramètre est : ', $aParam)
	ShellExecute($sNPPlus, $aParam , "")
Else
    ;   MsgBox(64, "Info", "Vous avez lancé le programme sans paramètres" & @TAB)
	ShellExecute($sNPPlus, "")
EndIf

