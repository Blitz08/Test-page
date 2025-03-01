@echo off
:: Prüfen, ob die Batchdatei mit Admin-Rechten läuft
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Administratorrechte werden benötigt. Das Skript wird jetzt mit Administratorrechten neu gestartet.
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

:: Falls Admin-Rechte vorhanden, den PowerShell-Befehl ausführen
powershell -Command "Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://php.new/install/windows/8.4'))"

pause