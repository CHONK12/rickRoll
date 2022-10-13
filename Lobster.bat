@echo off
powershell Set-ExecutionPolicy -Scope CurrentUser RemoteSigned
powershell -File C:\temp\rickRoll-main\blue.ps1
powershell Set-ExecutionPolicy -Scope CurrentUser Restricted
pause
