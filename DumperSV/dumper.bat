@echo off
color 7
mode 102,26
title MK-Leaks
cls
node index.js
echo Bienvenido %USERNAME%
echo.
start https://discord.gg/A6f8KdsUur 
color 0f
set /p cfx="[?] cfx.re address: "
set cfx=%cfx:~12%
echo [!] iniciando...
curl -s https://servers-frontend.fivem.net/api/servers/single/%cfx% >>%temp%\tmp.json
powershell "Get-Content %temp%\tmp.json | ConvertFrom-Json | ConvertTo-Json | Out-File -FilePath dump%cfx%.json"
del /q /f %temp%\tmp.json
for /f "tokens=*" %%a in ('type "dump%cfx%.json"') do (
ping localhost -n 1 >nul
echo [dumped] %%a)
echo [!] hecho, cerrando en 3 segundos...
ping -n 3 localhost >nul
exit