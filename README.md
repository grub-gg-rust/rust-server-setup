# Rust Dedicated Server Setup (Windows) with Oxide Mod Support

A minimal and portable setup for setting up a Rust dedicated server with Oxide (uMod) support on **Windows**.

## 🛠️ Installation

You can install or update the Rust server by following either the **scripted** or **manual** steps.

### ✅ Scripted (Recommended)

Begin by installing [SteamCMD](https://developer.valvesoftware.com/wiki/SteamCMD):

1. Download [SteamCMD](https://developer.valvesoftware.com/wiki/SteamCMD)
2. Extract `steamcmd.exe` to the `/windows/steamcmd` folder.

Next, simply run the `install_or_update.bat` file under `/windows/install_or_update.bat`.

This script will:

- Download and install the latest version of Rust Dedicated Server using SteamCMD.
- Automatically download the latest Oxide (uMod) version and install it to the server.

## 🧰 Manual

If you prefer to do it step-by-step:

1. Download [SteamCMD](https://developer.valvesoftware.com/wiki/SteamCMD)
2. Extract `steamcmd.exe` to the `/windows/steamcmd` folder.
3. Manually run the following command:

```bat
steamcmd.exe +force_install_dir ../server +login anonymous +app_update 258550 -beta public validate +quit
```

4. Download the latest Oxide build for Rust from:\
   https://umod.org/games/rust/download

5. Extract the contents into the `/windows/server` folder (overwrite existing files).

## 📁 Folder Structure (after installation)

After following the installation steps, the folder structure should look similar to this:

```
base-server-setup/
├── windows/
│   ├── steamcmd/
│   │   ├── ...
│   │   ├── steamcmd.exe
│   │   ├── ...
│   ├── server/
│   │   ├── ...
│   ├── install_or_update.bat
│   ├── start.bat
```

## 🚀 Running the Server

To launch the server, run:

Run the file `start.bat` under `/windows/start.bat`

This will start the Rust server with:

- Procedural map
- World size: 1000
- Max players: 250
- Game port: 28015
- Query port: 28016
- Hostname: grub.gg

## 📌 Notes

- Oxide/uMod is re-installed every time you run install_or_update.bat (to ensure compatibility with game updates).
- Make sure ports `28015` and `28016` are open in your firewall if hosting publicly.
