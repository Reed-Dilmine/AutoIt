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

;~ $Fen_Visu_Perturbo = GUICreate("PS8000 Visual Perturbo",1100,800,-1,-1,BitOr($WS_CAPTION,$WS_SYSMENU,$WS_BORDER),-1)
;~ GUISetBkColor(0x626262,$Fen_Visu_Perturbo)
;~ GUICtrlCreateGraphic(10,65,1074,612,-1)
;~ GUICtrlSetBkColor(-1,"0xFFFF80")
;~ $idExit=GUICtrlCreateButton("Exit",954,10,131,46,$BS_BITMAP,-1)
;~ GUICtrlSetFont(-1,14,700,0,"Dax-Italic")
;~ _GUICtrlButton_SetImage($idExit,"D:\Dilem\Documents\ISN AutoIt Studio\Projects\Graphique Perturbo b01\Images\Chn_Steel_Up.jpg",-1,True)
;~ ; GUICtrlSetBkColor(-1,"-2")
;~ $idChoix_Fichier=GUICtrlCreateButton("Fichier...",10,10,131,46,$WS_BORDER,-1)



$Fen_Visu_Perturbo = GUICreate("PS8000 Visual Perturbo",1100,800,-1,-1,BitOr($WS_CAPTION,$WS_SYSMENU,$WS_BORDER),-1)
GUISetBkColor(0x626262,$Fen_Visu_Perturbo)
GUICtrlCreateGraphic(10,60,1074,726,$BS_BITMAP)
GUICtrlSetBkColor(-1,"0x0080C0")
GUICtrlSetImage(-1,@scriptdir&"\"&"Images\Fond_02.bmp")
$idExit=GUICtrlCreateButton("Exit",954,10,131,46,$BS_BITMAP,-1)
GUICtrlSetFont(-1,14,700,0,"Dax-Italic")
GUICtrlSetBkColor(-1,"-2")
GUICtrlSetImage(-1,@scriptdir&"\"&"Images\Chn_Steel_Up.bmp")
$idChoix_Fichier=GUICtrlCreateButton("Fichier...",10,10,131,46,$BS_BITMAP,-1)
GUICtrlSetFont(-1,14,700,0,"Dax-Italic")
GUICtrlSetBkColor(-1,"-2")
GUICtrlSetImage(-1,@scriptdir&"\"&"Images\Chn_Steel_Up.bmp")
GUICtrlSetTip(-1,"Choisir un fichier à analyser")
GUISetState(@SW_SHOW,$Fen_Visu_Perturbo)

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		
		Case $idExit
			Exit
			
		Case $idChoix_Fichier
			Choix_Fichier()
		
	EndSwitch
WEnd

Func Choix_Fichier()
	$NomFichier=FileOpenDialog("Choisir un Fichier","D:\Captures"," DAT (*.dat)",0,"")

	Switch $NomFichier
		Case 1,2
			MsgBox(4144,"Erreur","Pas de Fichier sélectionné !",0)
			
		Case Else
			MsgBox(4144,"Fichier",$NomFichier,0)
			
	EndSwitch
EndFunc





