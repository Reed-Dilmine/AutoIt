;Bouton image text.au3

; Text over Button
#include <GuiConstants.au3>
#include <WinAPI.au3>
#include <Misc.au3>

Opt("GUIOnEventMode", 1)

Global $i = 1, $color = "Red", $Gui1, $button1, $b1label, $aCtrlInfo

; Create the GUI
$Gui1 = GUICreate("Text over Button", 300, 300)
GUISetOnEvent($GUI_EVENT_CLOSE, "_Exit")
$button1 = GUICtrlCreatePic(@scriptdir&"\"&"Images\Red.gif", 10, 12, 75, 25)
GUICtrlSetState(-1, $GUI_DISABLE)
$b1label = GUICtrlCreateLabel("Red", 10, 12, 75, 25, 0x201)
GUICtrlSetBkColor($b1label, $GUI_BKCOLOR_TRANSPARENT)
;GUICtrlSetOnEvent($button1, "Change")
GUICtrlSetOnEvent($b1label, "Change")

GUISetState(@SW_SHOW)

While 1
    Sleep(10)
    $aCtrlInfo = GUIGetCursorInfo()
    If IsArray($aCtrlInfo) Then
        If $aCtrlInfo[4] = $b1label Then
            If $i <> 2 Then ; Avoid continuously setting image
                GUICtrlSetImage($button1, @scriptdir&"\"&"Images\Yellow.gif")
                GUICtrlSetData($b1label, "Yellow")
                $i = 2
            EndIf
            Sleep(10)
        ElseIf $i <> 1 Then ; Avoid continuously setting image
            GUICtrlSetImage($button1, @scriptdir&"\"&"Images\Red.gif")
            GUICtrlSetData($b1label, "Red")
            $i = 1
        EndIf
    EndIf
WEnd


Func Change()
    Do
        If $i <> 3 Then
            GUICtrlSetImage($button1, @scriptdir&"\"&"Images\Green.gif")
            GUICtrlSetData($b1label, "Green")
            $i = 3
        EndIf
        Sleep(10)
    Until Not _IsPressed("01")
    $aCtrlInfo = GUIGetCursorInfo()
    If IsArray($aCtrlInfo) Then
        If $aCtrlInfo[4] = $b1label Then ; Mouse must be over button when released else will not work.
            MsgBox(0, "", " Button pressed", 1, $Gui1) ; <--- When button is pressed properly.
        EndIf
    EndIf
    GUICtrlSetImage($button1, @scriptdir&"\"&"Images\Red.gif")
    GUICtrlSetData($b1label, "Red")
    $i = 1
EndFunc ;==>Change

Func _Exit()
    Exit
EndFunc ;==>_Exit