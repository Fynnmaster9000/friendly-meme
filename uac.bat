@echo off
:: Disable EnableLua
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v EnableLua /t REG_DWORD /d 0 /f

:: Disable Task Manager
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v DisableTaskMgr /t REG_DWORD /d 1 /f

:: Disable Registry Editor
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v DisableRegistryTools /t REG_DWORD /d 1 /f

:: Show message box
echo MsgBox "EnableLua, Task Manager, and Regedit disabled." ^& vbCrLf ^& "System will now restart.", 64, "Done" > "%temp%\msgbox.vbs"
cscript //nologo "%temp%\msgbox.vbs"
del "%temp%\msgbox.vbs"

:: Restart
shutdown /r /t 5 /c "Restarting to apply changes..."
