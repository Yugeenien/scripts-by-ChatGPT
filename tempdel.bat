@echo off
---------------------------------------------------------------------
:: Set the Ultimate Performance Power Plan
powercfg /setactive 5b8d285e-e2da-48d6-8662-1e89e2eee1ed
::change power plan code for your power plan(use powercfg in cmd)
---------------------------------------------------------------------

::kill edge processes
taskkill /f /im msedge.exe >nul 2>&1

taskkill /f /im msedgewebview2.exe >nul 2>&1



---------------------------------------------------------------------
:: Run as Administrator (if not already)makes it run as administrator automaically so more temp will be cleared
net session >nul 2>&1
if %errorLevel% neq 0 (
    powershell Start-Process '%0' -Verb RunAs
    exit
)

::ATTENTION!!!!!!!!
::ATTENTION!!!!!!!!
::ATTENTION!!!!!!!!
::change path for your temp and %temp% folders IF NEEDED in line 34,35,38,39
::ATTENTION!!!!!!!!
::ATTENTION!!!!!!!!
::ATTENTION!!!!!!!!


:: Delete Windows Temp files
echo Cleaning C:\Windows\Temp...
del /s /f /q C:\Windows\Temp\* >nul 2>&1
for /d %%X in (C:\Windows\Temp\*) do rd /s /q "%%X" >nul 2>&1

:: Delete User Temp files
del /s /f /q %temp%\* >nul 2>&1
for /d %%X in (%temp%\*) do rd /s /q "%%X" >nul 2>&1

:: Delete Local AppData Temp files

---------------------------------------------------------------------