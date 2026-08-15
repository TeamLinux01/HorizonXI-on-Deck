# Setting up HorizonXI on Valve's Steam Deck

These instructions and script install version 2.0.3 of the [launcher](https://github.com/HorizonFFXI/HorizonXI-Launcher-Binaries/releases).

> [!WARNING]
> The script has been changed to install HorizonXI into the root of C:\. This is a breaking change from the way the script was working previously, as it was installing to C:\ProgramFiles (x86)\HorizonXI. The change is to remove the warning about the location of the install having issues accessing the files.

This script will automatically setup the Windows install path to be `C:\HorizonXI` inside the prefix. I will also turn on several add-ons that I use and set the resolution to 720p and rendering resolution to 1440p. I am doing using this resolution instead of 800p so that when I dock to a 16x9 screen, it doesn't stretch. Feel free to change it to 800p/1600p in the launcher.

Also added the D3D8 to D3D9 proxy by atom0s,
Final Fantasy XI - Direct3D8 to Direct3D9 Proxy
(c) 2018 Ashita Development Team

## Steam Deck Thread in HorizonXI discord

> [!WARNING]
> This installation method is not supported in the HorizonXI discord thread titled Steam Deck Thread.

Please follow the guide: https://gitlab.com/MattyGWS/HorizonXI-Linux-Installation/ instead.

> [!NOTE]
> Feel free to open a Github issue for my script and I will try to help out as soon as I am able.

## Prerequisites

* [Register a HorizonXI account](https://horizonxi.com/register)
* [Create a character](https://horizonxi.com/account)
* Install the proton version **cachyos-10.0-20260425-slr** from *ProtonPlus*
* Have a USB or Bluetooth keyboard connected to the Steam Deck

## Setup

1. On Desktop mode, open terminal and run
   ```
   wget https://raw.githubusercontent.com/TeamLinux01/HorizonXI-on-Deck/refs/heads/main/horizonxi-setup.sh -O ~/Downloads/horizonxi-setup.sh;chmod +x ~/Downloads/horizonxi-setup.sh;sh ~/Downloads/horizonxi-setup.sh
   ```
   After this is ran, there will be *Games/HorizonXI* folders in your user home folder.

1. Download proton version **cachyos-10.0-20260425-slr** from *ProtonPlus*. It may require restarting Steam for the new proton version to be detected by Steam.

1. Open Steam and click the **Add a Game** button on the bottom-left of Steam's desktop interface. Click **Add a Non-Steam Game...**, click **Browse...* button on the window that popped-up, navigate to *Home/Games/HorizonXI/Launcher/* and click **HorizonXI-Launcher.exe** and then click the **Open** button. Click the blue **Add Selected Programs** button.

1. Right-click the Steam game **HorizonXI-Launcher.exe** and click on **Properties...*

    1. Add
       ```
       STEAM_COMPAT_DATA_PATH="$HOME"/Games/HorizonXI/Prefix/ WINEDLLOVERRIDES="d3d8=n,b" DXVK_FRAME_RATE=60 %command%
       ```
       to the *LAUNCH OPTIONS*

    1. Click **Compatibility** tab, checkbox **Force the use of a specific Steam Play compatibility tool** and select **cachyos-10.0-20260425-slr**.

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
<home>/Games/HorizonXI/Prefix/pfx/drive_c/HorizonXI/Game/config
```
```
<home>/Games/HorizonXI/Prefix/pfx/drive_c/HorizonXI/Game/scripts
```
```
<home>/Games/HorizonXI/Prefix/pfx/drive_c/HorizonXI/Game/SquareEnix/FINAL FANTASY XI/USER
```

Now HorizonXI will will show up as a game to backup and restore.

## MD5 sums of the Download files

> [!WARNING]
> If you have issues with Ashita not logging you in, you are probably using the HorizonXI.zip that has the md5sum of 6a812bfaf94ea07afac6b6ce9cb82b54 or different HorizonXI.zip than the latest, which has an older version of the Ashita-cli.exe.
> Delete the files in your $HOME/Games/Horizon/Downloads, delete the $HOME/Games/HorizonXI/Prefix folder and run the script again. It should recreate everything.

It seems the launcher downloads a different HorizonXI.zip, which may report "HorizonXI.zip contained no game files. Re-download to continue."
Close the launcher, etractact the contents of the zip to the Game folder and change the following file to look like this, which should allow the launcher to update:

> [!NOTE]
> The line that should be changed is "extracted": false

`$HOME/Games/HorizonXI/Prefix/pfx/drive_c/users/steamuser/AppData/Roaming/HorizonXI-Launcher/storage.json`
```
...
	"GAME_UPDATER": {
		"currentVersion": 20,
		"currentMarketingVersion": "2.0.2",
		"latestVersion": 20,
		"baseGame": {
			"downloaded": true,
			"extracted": true
		},
...
```

Hopefully this gets fixed, otherwise a script might need to be made to automatically extract the contents.
If it gets fixed via a change to the HorizonXI.zip, I will update the MD5 checksum that I have recorded.

In case someone needs to check if their downloaded files in the $HOME/Games/HorizonXI/Downloads are corrupted

* 85327f6f67099ddce981492d6bffb080  HorizonXI-1_1.zip
* 07b7b2742066e1d55716a3f086bbdfad  HorizonXI-1_1_1.zip
* cf22686104233254054024df8d6743e7  HorizonXI-1_1_2.zip
* 1a90c20da02a766c9484642b0a03b4ef  HorizonXI-1_1_3.zip
* 11145d3512290dc098d4ad07b2df37a0  HorizonXI-1.2.0.zip
* 718958dd8030247ea11d00d226f64270  HorizonXI-1_2_1.zip
* 604aa9344da85960708137fefc3705b4  HorizonXI-1_2_2.zip
* 853b9d3ae6a78ed42c23bf406c76a19e  HorizonXI-1_2_3.zip
* ec5876188fd79fd2c5449e49be5da8eb  HorizonXI-1_2_4.zip
* fc4c5da2a1d8415300ad176a9c79354e  HorizonXI-1_2_5.zip
* 9be7fced6c20f07716edf18f6af5b133  HorizonXI-1_2_6.zip
* 78c7e129796d76cbb07db7c4374a9dac  HorizonXI-1_2_7.zip
* 25a3abe65e77b8547ed04c54d40daf13  HorizonXI-1_2_8.zip
* b2ac5ce4d66ba97d5d8ba4b62731c968  HorizonXI-1_9_0.zip
* 3c4f987d8efa81c0f1e9aec69c4c540d  HorizonXI-1_9_1.zip
* dd354e6f6e659bb2e2638169329c43db  HorizonXI-1_9_2.zip
* 88cdf0095a82d4c57553117182cf60d0  HorizonXI-2_0_0.zip
* 8c23de83a5044b18e9761c6f9fe5cc4e  HorizonXI-2_0_1.zip
* 190b84b5465b4e81dd2488ebbff75c7e  HorizonXI-2_0_2.zip
* 95d225cfed9f22107a784c6ea0d50cf8  prereqs.zip

> [!NOTE]
> There is now a user script in Windows for cleaning a HorizonXI install, so sometimes things just need to be removed and started over. DO NOT USE THIS ON LINUX! Just delete the Prefix folder and the Downloads files.
> https://github.com/clanofartisans/clean-uninstall-horizonxi/releases for Windows users.
