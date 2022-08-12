;---------------------------------------------------
;
; ISN AutoIt Studio Testproject (build 31.03.2018)
; by ISI360 (Christian Faderl), created with ISN Autoit Studio
;
;---------------------------------------------------
; Welcome in the ISN AutoIt Studio Testproject!
; This is an example of how a project can be structured within the ISN AutoIt Studio.
; It also includes a sample GUI with some functions for testing.
;---------------------------------------------------
;
; What this script does:
; - Shows an example GUI (Testform.isf), which is designed with the ISN Form Studio 2.
; 	|-> The .isf GUI is directly included in this script. So you do not need to copy/paste the GUI code from the Form Studio to this script.
; 	|-> Feel free to open the Testform.isf in the Forms folder! Make some edits and save it. And that´s it! Run the project (this script) and directly see your changes!
; - Some controls in the Gui have Click on Events to functions.
;	|-> For example if you click on the soft button in the gui, you will get an MessageBox.
; - The code Areas in this script are divided into Regions with custom names. So you can easily navigate to it through the script tree on the right side.
;
; Run this project with the F5 key. (Or choose Project -> Test project from the menubar)
; Happy testing!
;---------------------------------------------------

#Region AutoIt Options
;Here we set the needed AutoIt Options for our script.
Opt("GUIOnEventMode", 1) ;Enable OnEventMode
#EndRegion AutoIt Options


#Region Includes
;AutoIt Include
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <SliderConstants.au3>
#include <GuiSlider.au3>
#include <GuiTab.au3>
#include <DateTimeConstants.au3>
#include <GuiButton.au3>
#include <GuiIPAddress.au3>

;Custom Includes
#include "Forms\Testform.isf" ;This is the main GUI window. You can directly include an .isf into your script! No code copy/paste is needed! (NOTE: Every GUI is hidden by default!)
#EndRegion Includes


#Region Main Code
;The Main Code of this testscript
;This stuff will be executed when the script starts.


;Let´s write something in the output console
ConsoleWrite("- Hello world!" & @CRLF) ;Elements started with "-" are printed in orange.
ConsoleWrite("+ Looks like your username is " & @UserName & "!" & @CRLF) ;Elements started with "+" are printed in green.
ConsoleWrite("! This could be an error text..." & @CRLF) ;Elements started with "!" are printed in red.
ConsoleWrite("> And at least some blue text :)" & @CRLF) ;Elements started with ">" are printed in blue.


;Fill the IPAdress Control in the GUI with @IPAddress1
_GUICtrlIpAddress_Set($ip_control, @IPAddress1)


;Create some test Items in the TreeView
$generalitem = GUICtrlCreateTreeViewItem("General", $htreeview)
GUICtrlCreateTreeViewItem("Test", $generalitem)
GUICtrlCreateTreeViewItem("Test", $generalitem)


;And finally, show the GUI on the screen!
GUISetState(@SW_SHOW, $Testform)
#EndRegion Main Code


#Region Custom Functions
;Contains custom Functions for this testscript.

; #FUNCTION# ====================================================================================================================
; Name ..........: _Softbutton_Click
; Description ...: This functions is executed when you click on the softbutton in the GUI.
; Syntax ........: _Softbutton_Click()
; Parameters ....: None
; Return values .: None
; Author ........: ISI360
; Modified ......:
; Remarks .......:
; Related .......:
; Link ..........:
; Example .......: No
; ===============================================================================================================================
Func _Softbutton_Click()
	MsgBox($MB_ICONINFORMATION, "Info", "Hey " & @UserName & "!" & @CRLF & "You have clicked on the softbutton!", 0, $Testform)
EndFunc   ;==>_Softbutton_Click

; #FUNCTION# ====================================================================================================================
; Name ..........: _Move_Slider
; Description ...: This function is called when you move the slider in the GUI.
; Syntax ........: _Move_Slider()
; Parameters ....: None
; Return values .: None
; Author ........: ISI360
; Modified ......:
; Remarks .......:
; Related .......:
; Link ..........:
; Example .......: No
; ===============================================================================================================================
Func _Move_Slider()
	GUICtrlSetData($progressbar, GUICtrlRead($progress_slider))
	GUICtrlSetData($progress_text, "Move the slider above me! (" & GUICtrlRead($progressbar) & " %)")
EndFunc   ;==>_Move_Slider

; #FUNCTION# ====================================================================================================================
; Name ..........: _Exit
; Description ...: We use this function to exit the script. It´s used in "File -> Exit" or the Close Button of the GUI.
; Syntax ........: _Exit()
; Parameters ....: None
; Return values .: None
; Author ........: ISI360
; Modified ......:
; Remarks .......:
; Related .......:
; Link ..........:
; Example .......: No
; ===============================================================================================================================
Func _Exit()
	Exit
EndFunc   ;==>_Exit

#EndRegion Custom Functions


#Region While Loop
While 1
	Sleep(100) ;Idle
WEnd
#EndRegion While Loop
