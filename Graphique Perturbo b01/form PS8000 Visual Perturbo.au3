; -- Created with ISN Form Studio 2 for ISN AutoIt Studio -- ;
#include <StaticConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#Include <GuiButton.au3>

$Fen_Visu_Perturbo = GUICreate("PS8000 Visual Perturbo",1100,800,-1,-1,BitOr($WS_CAPTION,$WS_SYSMENU,$WS_BORDER),-1)
GUISetBkColor(0x626262,$Fen_Visu_Perturbo)
GUICtrlCreateGraphic(10,60,1074,726,-1)
GUICtrlSetBkColor(-1,"-2")
GUICtrlSetImage(-1,"D:\Dilem\Documents\ISN AutoIt Studio\Projects\Graphique Perturbo b01\Images\Fond_02.jpg")
GUICtrlCreateButton("Exit",954,10,131,46,$WS_BORDER,-1)
GUICtrlSetOnEvent(-1,"Sortir")
GUICtrlSetFont(-1,14,700,0,"Dax-Italic")
GUICtrlSetBkColor(-1,"-2")
GUICtrlSetImage(-1,"D:\Dilem\Documents\ISN AutoIt Studio\Projects\Graphique Perturbo b01\Images\Chn_Steel_Up.jpg")
GUICtrlCreateButton("Fichier...",10,10,131,46,$WS_BORDER,-1)
GUICtrlSetFont(-1,14,700,0,"Dax-Italic")
GUICtrlSetBkColor(-1,"-2")
GUICtrlSetImage(-1,"D:\Dilem\Documents\ISN AutoIt Studio\Projects\Graphique Perturbo b01\Images\Chn_Steel_Up.jpg")
GUICtrlSetTip(-1,"Choisir un fichier à analyser")
GUISetState(@SW_SHOW,$Fen_Visu_Perturbo)


While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit

	EndSwitch
WEnd
