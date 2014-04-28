Const $DELL_UTILITY_APP = "Dell System and Devices Manager"
Const $DELL_UTILITY_PATH = "C:\Program Files\Dell\Dell System Manager\DCP_Display.exe"

; PID of process started by script
Global $Pid

Func Main()
  Local $window = PrepareDellUtility()
  ; Click ALS
  MouseClick("", 204, 166)
  ProcessClose($Pid)
  Exit(0)
EndFunc

; Resets or starts DellUtility application
Func PrepareDellUtility()
  Local $window
  If WinExists($DELL_UTILITY_APP) Then
    $window = WinActivate($DELL_UTILITY_APP)
  Else
    Run($DELL_UTILITY_PATH)
    $window = WinWaitActive($DELL_UTILITY_APP)
  EndIf
  $Pid = WinGetProcess($window)
  WinMove($window, "", 0, 0)
  Return $window
EndFunc


Main()


