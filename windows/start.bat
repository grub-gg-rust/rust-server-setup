@echo off
set SERVER_DIR=%~dp0server

cd /d "%SERVER_DIR%"
start "RustDedicated" /B RustDedicated.exe -batchmode ^
    +server.port 28015 ^
    +server.queryport 28016 ^
    +server.level "Procedural Map" ^
    +server.worldsize 1000 ^
    +server.maxplayers 250 ^
    +server.hostname "grub.gg" ^
    +server.identity "servername"

pause