# Setting up HorizonXI on Valve's Steam Deck

These instructions and script install version 1.9.1 of the [launcher](https://github.com/HorizonFFXI/HorizonXI-Launcher-Binaries/releases).

This script will automatically setup the Windows install path to be `C:\Program Files (x86)` inside the prefix. I will also turn on several add-ons that I use and set the resolution to 720p and rendering resolution to 1440p. I am doing using this resolution instead of 800p so that when I dock to a 16x9 screen, it doesn't stretch. Feel free to change it to 800p/1600p in the launcher.

## Prerequisites

* [Register a HorizonXI account](https://horizonxi.com/register)
* [Create a character](https://horizonxi.com/account)
* Install the latest version of GE-Proton or GE-Proton7-42 via [ProtonUp-Qt](https://flathub.org/apps/net.davidotek.pupgui2)
* Have a USB or Bluetooth keyboard connected to the Steam Deck

## Setup

1. On Desktop mode, go to [horizonxi-setup.sh](./horizonxi-setup.sh) page and download the file by clicking `Download raw file`, change the permission property to **execute**, right-click the file and click **Run In Konsole**. It will automatically download the launcher and setup the ~/Games/HorizonXI folders.

1. Download proton version **GE-Proton7-42** from *ProtonUp-Qt*. It may require restarting Steam for the new proton version to be detected by Steam.

1. Open Steam and click the **Add a Game** button on the bottom-left of Steam's desktop interface. Click **Add a Non-Steam Game...**, click **Browse...* button on the window that popped-up, navigate to *Home/Games/HorizonXI/Launcher/* and click **HorizonXI-Launcher.exe** and then click the **Open** button. Click the blue **Add Selected Programs** button.

1. Right-click the Steam game **HorizonXI-Launcher.exe** and click on **Properties...*

    1. Add
       ```
       STEAM_COMPAT_DATA_PATH="$HOME"/Games/HorizonXI/Prefix/ %command%
       ```
       to the *LAUNCH OPTIONS*

    1. Click **Compatibility** tab, checkbox **Force the use of a specific Steam Play compatibility tool** and select **GE-Proton7-42**.

    1. Feel free to rename the game name at this point.

1. Click **Play**, the launcher should now come up.

    1. Click **Install Game** button in the launcher. After it done installing, it will most likely come up with an **Update Game** button, so click that button when it comes up.

    1. Fill in the Username, Password and click the **Login** button.

    1. Click the **Play HorizonXI** when it is enabled.

Enjoy the game! It should be safe to restart into game mode. Don't forget to setup *Steam Input* in Steam, so you can still use the mouse and the rest of the controller.

### Updating the launcher

Download the newest version of the script and re-run it. It will ask if you would like to remove the launcher files, type `y` to say yes. It will then download the new launcher files and extract them to the same location as the previous version.

At this point, you can close the script and go back to using the game as normal; nothing else should need to be touched.

If the updated launcher has changed some add-ons, you can change the settings inside the launcher at the point of starting the game with the new launcher.

## Backup settings

Settings can be easily backed up and restored using the program [Ludusavi](https://flathub.org/apps/com.github.mtkennerly.ludusavi).

Under **CUSTOM GAMES** tab, click the **Add game** button and add the following settings.

`Name:`
```
HorizonXI
```
`Type drop-down: Game`

Add three paths:
```
<home>/Games/HorizonXI/Prefix/pfx/drive_c/Program Files (x86)/HorizonXI/Game/config
```
```
<home>/Games/HorizonXI/Prefix/pfx/drive_c/Program Files (x86)/HorizonXI/Game/scripts
```
```
<home>/Games/HorizonXI/Prefix/pfx/drive_c/Program Files (x86)/HorizonXI/Game/SquareEnix/FINAL FANTASY XI/USER
```

Now HorizonXI will will show up as a game to backup and restore.
