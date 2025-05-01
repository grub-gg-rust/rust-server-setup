@echo off
setlocal

set STEAMCMD_DIR=%~dp0steamcmd
set SERVER_DIR=%~dp0server
set STEAM_CMD_ZIP=steamcmd.zip
set STEAM_CMD_URL=https://steamcdn-a.akamaihd.net/client/installer/steamcmd.zip
set OXIDE_ZIP=Oxide.Rust.zip
set OXIDE_URL=https://umod.org/games/rust/download

echo [INFO] Installing latest version of SteamCMD...
if not exist "%STEAMCMD_DIR%" (
    echo [INFO] Creating SteamCMD directory...
    mkdir "%STEAMCMD_DIR%"
)
if not exist "%STEAMCMD_DIR%\steamcmd.exe" (
    echo [INFO] Downloading SteamCMD...
    powershell -Command "Invoke-WebRequest -Uri '%STEAM_CMD_URL%' -OutFile '%STEAM_CMD_ZIP%'"

    echo [INFO] Extracting SteamCMD...
    powershell -Command "Expand-Archive -Path '%STEAM_CMD_ZIP%' -DestinationPath '%STEAMCMD_DIR%' -Force"

    echo [INFO] Cleaning up...
    del "%STEAM_CMD_ZIP%"
) else (
    echo [INFO] SteamCMD already installed.
)

echo [INFO] Installing latest version of Rust Dedicated Server...
"%STEAMCMD_DIR%\steamcmd.exe" ^
    +force_install_dir "%SERVER_DIR%" ^
    +login anonymous ^
    +app_update 258550 -beta public validate ^
    +quit

echo [INFO] Downloading latest Oxide mod...
powershell -Command "Invoke-WebRequest -Uri '%OXIDE_URL%' -OutFile '%OXIDE_ZIP%'"

echo [INFO] Extracting Oxide mod into server folder...
powershell -Command "Expand-Archive -Path '%OXIDE_ZIP%' -DestinationPath '%SERVER_DIR%' -Force"

echo [INFO] Cleaning up...
del "%OXIDE_ZIP%"

echo [DONE] Rust server updated with Oxide mod.
pause