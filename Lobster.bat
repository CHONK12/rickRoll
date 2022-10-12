@echo off
powershell Set-ExecutionPolicy -Scope CurrentUser RemoteSigned
powershell -File C:\temp\blue.ps1
powershell Set-ExecutionPolicy -Scope CurrentUser Restricted
