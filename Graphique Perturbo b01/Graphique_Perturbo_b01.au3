;*****************************************
;Graphique_Perturbo_b01.au3 by dlemen
;Créé avec ISN AutoIt Studio v. 1.02
;*****************************************
#i; -- Created with ISN Form Studio 2 for ISN AutoIt Studio -- ;
#include <StaticConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#Include <GuiButton.au3>
#include <TreeViewConstants.au3>
#include <GDIPlus.au3>
#include <Math.au3>
#include <Array.au3>
#include <File.au3>

_GDIPlus_Startup()
; Fenetre Principale
$h_Fen_Visu_Perturbo = GUICreate("PS8000 Visual Perturbo",1100,800,-1,-1,BitOr($WS_CAPTION,$WS_SYSMENU,$WS_BORDER),-1)
GUISetBkColor(0x626262,$h_Fen_Visu_Perturbo)

; Bouton Exit
$b_Exit=GUICtrlCreateButton("Exit",954,10,131,46,-1,-1)
GUICtrlSetFont(-1,14,700,0,"Dax-Italic")

; Bouton Choix Fichier
$b_ChoixFichier=GUICtrlCreateButton("Fichier...",10,10,131,46,-1,-1)
GUICtrlSetFont(-1,14,700,0,"Dax-Italic")

; Fenetre de dessin de la courbe
$h_Graph = GUICreate("", 1000, 700, 50, 80, $WS_BORDER, Bitor($WS_EX_MDICHILD,$WS_EX_WINDOWEDGE), $h_Fen_Visu_Perturbo)
GUISetBkColor("0xE6F5FD", $h_Graph)
; Bouton Fermer
$b_Fermer=GUICtrlCreateButton("Fermer",850,10,100,40,-1,-1)
GUICtrlSetFont(-1,14,700,0,"Dax-Italic")

; Affiche la fenetre principale
GUISetState(@SW_SHOW,$h_Fen_Visu_Perturbo)

; Boucle principale
While 1
	Local $nMsg = GUIGetMsg()
	Local $Nom_Courbe=""
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			_GDIPlus_Shutdown()
			GUIDelete($h_Fen_Visu_Perturbo)
			GUIDelete($h_Graph)
			Exit
		
		Case $b_Exit
			Exit
			
		Case $b_ChoixFichier
			$Nom_Courbe=Choix_Fichier()
			if IsString($Nom_Courbe) Then
				Trace_Courbe($Nom_Courbe)
			EndIf
			
	EndSwitch
WEnd

; Ouvre une fenetre sur D:\Captures et permet de choisir un fichier .dat
Func Choix_Fichier()
	Local $NomFichier=FileOpenDialog("Choisir un Fichier","D:\Captures"," DAT (*.dat)",0,"")
	Switch $NomFichier
		Case 1,2
			MsgBox(4144,"Erreur","Pas de Fichier sélectionné !",0)
		Case Else
			Return($NomFichier)
	EndSwitch
EndFunc

; Trace la courbe lue dans le fichier .dat
Func Trace_Courbe($Nom)
	Local $aPoints, $i
	Local $hPen = _GDIPlus_PenCreate(0xFF000000, 2) 
	Local $Local_Graph = _GDIPlus_GraphicsCreateFromHWND($h_Graph)
	
	GUISetState(@SW_SHOW,$h_Graph)

;~ 	$aPoints[0][0] = 8
;~     $aPoints[1][0] = 0
;~     $aPoints[1][1] = 100
;~     $aPoints[2][0] = 50
;~     $aPoints[2][1] = 50
;~     $aPoints[3][0] = 100
;~     $aPoints[3][1] = 100
;~     $aPoints[4][0] = 150
;~     $aPoints[4][1] = 10
;~     $aPoints[5][0] = 200
;~     $aPoints[5][1] = 120
;~     $aPoints[6][0] = 250
;~     $aPoints[6][1] = 50
;~     $aPoints[7][0] = 300
;~     $aPoints[7][1] = 100
;~     $aPoints[8][0] = 350
;~     $aPoints[8][1] = 50

	If Read_Dat_File($Nom, $aPoints) = 0 Then Return
MsgBox(262144,'Debug line ~' & @ScriptLineNumber,'Selection:' & @lf & 'Read_Dat_File' & @lf & @lf & 'Return:' & @lf &Read_Dat_File) ;### Debug MSGBOX
_ArrayDisplay($aPoints)
	; Mise à l'échelle
	For $i = 1 to $aPoints[0][0]
		$aPoints[$i][0] = $aPoints[$i][0]*900/350 + 50
		$aPoints[$i][1] = $aPoints[$i][1]*700/100/1.5
	Next
	Sleep(1000)
	; Trace la courbe
    _GDIPlus_GraphicsDrawCurve2($Local_Graph, $aPoints, 0.5, $hPen)
	; boucle d'attente appui sur bouton
	While GUIGetMsg() <> $b_Fermer
	Wend
	; efface la courbe, libere les ressources, ferme la fenetre
	_GDIPlus_GraphicsClear($Local_Graph, 0xFFE6F5FD)
	_GDIPlus_PenDispose($hPen)
	_GDIPlus_GraphicsDispose($Local_Graph)
	Sleep(1000)
	GUISetState(@SW_HIDE,$h_Graph)
EndFunc

; Ouvre le fichier .dat et rempli un tableau avec les valeurs
Func Read_Dat_File($Nom, Byref $aRetArray)
	Local $LongFile
	Local $hFichier
	$hFichier=FileOpen($Nom)			
	If $hFichier <> -1 Then 			; si le fichier existe
		$LongFile = FileGetSize($Nom)
		If $LongFile > 0 Then			; si +grand que 0
			If _MathCheckDiv($LongFile) = 2 Then			; si longueur est multiple de 2
				If _FileReadToArray($Nom, $aRetArray, Default, ",") Then 
MsgBox(262144,'Debug line ~' & @ScriptLineNumber,'Selection:' & @lf & 'If _FileReadToArray($Nom, $aRetArray, Default, ",") Then' & @lf & @lf & 'Return:' & @lf & _FileReadToArray($Nom, $aRetArray, Default, ",") ) ;### Debug MSGBOX
					_ArrayDisplay($aRetArray)
					FileClose($hFichier)
					Return(0)
				Else
					FileClose($hFichier)
					Return(1)
				EndIf
			EndIf
		EndIf
	EndIf
EndFunc#include "Test Fen01.isf"
