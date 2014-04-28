Const $DELL_UTILITY_APP = "Dell System and Devices Manager"
Const $DELL_UTILITY_PATH = "C:\Program Files\Dell\Dell System Manager\DCP_Display.exe"
Const $DELL_ERROR_APP = "Application: Fatal error"

; PID of process started by script
Global $Pid

Func Main()
  Local $window = PrepareDellUtility()
  ; Click ALS
  Sleep(500)
  MouseClick("", 204, 166, 1, 5)
  ProcessClose($Pid)
  Exit(0)
EndFunc

; Resets or starts DellUtility application
Func PrepareDellUtility()
  Local $window
  Local $errorWindow
  If WinExists($DELL_UTILITY_APP) Then
    $window = WinActivate($DELL_UTILITY_APP)
  Else
    Run($DELL_UTILITY_PATH)
    $window = WinWaitActive($DELL_UTILITY_APP, "", 1)
	If $window == 0 Then
      $errorWindow = WinWait($DELL_ERROR_APP, "", 1)
      If $errorWindow <> 0 Then
		 ControlClick($DELL_ERROR_APP, "", "OK")
		 Sleep(1000)
		 Return PrepareDellUtility()
	  Else
		 $Pid = WinGetProcess($window)
		 ProcessClose($Pid)
		 Exit(1)
	  EndIf
    EndIf
  EndIf
  $Pid = WinGetProcess($window)
  WinMove($window, "", 0, 0)
  Return $window
EndFunc


Main()


