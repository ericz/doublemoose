Const $VECTOR_MAGIC_APP = "Dell System and Devices Manager"
Const $VECTOR_MAGIC_PATH = "C:\Program Files\Dell\Dell System Manager\DCP_Display.exe"

; PID of process started by script
Global $Pid

Func Main()
  Local $window = PrepareVectorMagic()
  ; Click ALS
  MouseClick("", 204, 166)
  ProcessClose($window)
  Exit(0)
EndFunc

; Resets or starts VectorMagic application
Func PrepareVectorMagic()
  Local $window
  If WinExists($VECTOR_MAGIC_APP) Then
    $window = WinActivate($VECTOR_MAGIC_APP)
  Else
    Run($VECTOR_MAGIC_PATH)
    $window = WinWaitActive($VECTOR_MAGIC_APP)
  EndIf
  $Pid = WinGetProcess($window)
  WinMove($window, "", 0, 0)
  Return $window
EndFunc


Main()


