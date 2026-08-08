#!/bin/bash
version=2.0.1
GREEN='\033[0;32m'
RED='\033[0;31m'
REMOVE='\033[0m'

if [ ! -d "$HOME/Games/HorizonXI/Downloads" ]; then
  echo -e "${GREEN}Premaking the Downloads folder.${REMOVE}"
  mkdir "$HOME/Games/HorizonXI/Downloads"
fi

if [ -d "$HOME/Games/HorizonXI/Launcher" ]; then
  read -p 'Delete Launcher files to update?' yesno
  case $yesno in
  [Yy]* )
    rm -vr "$HOME/Games/HorizonXI/Launcher"
    ;;
  [Nn]* )
    ;;
  esac
fi

if [ ! -d "$HOME/Games/HorizonXI/Launcher" ]; then
  mkdir -p "$HOME"/Games/HorizonXI/Launcher/download
  pushd "$HOME/Games/HorizonXI/Launcher/download" >/dev/null || exit 1
  echo -e "${GREEN}Downloading and extacting the launcher.${REMOVE}"
  wget -c https://github.com/HorizonFFXI/HorizonXI-Launcher-Binaries/releases/download/v$version/HorizonXI-Launcher-$version.Setup.exe && \
  7z x HorizonXI-Launcher-$version.Setup.exe && \
  7z x HorizonXI_Launcher-$version-full.nupkg && \
  mv lib/net45/* "$HOME/Games/HorizonXI/Launcher/" && \
  echo -e "${GREEN}Completed Launcher placement.${REMOVE}"
  popd >/dev/null || exit 1
fi

if [ -d "$HOME/Games/HorizonXI/Prefix/pfx" ]; then
  read -p 'Delete configuration and D3D8 files?' yesno
  case $yesno in
  [Yy]* )
    rm -v "$HOME"/Games/HorizonXI/Prefix/pfx/drive_c/users/steamuser/AppData/Roaming/HorizonXI-Launcher/config.json "$HOME"/Games/HorizonXI/Prefix/pfx/drive_c/users/steamuser/AppData/Roaming/HorizonXI-Launcher/storage.json "$HOME/Games/HorizonXI/Prefix/pfx/drive_c/Program Files (x86)/HorizonXI/Game/bootloader/d3d8.ini" "$HOME/Games/HorizonXI/Prefix/pfx/drive_c/Program Files (x86)/HorizonXI/Game/bootloader/d3d8.dll"
    ;;
  * );;
  esac
fi

if [ -d "$HOME/Games/HorizonXI/Prefix/pfx" ]; then
  echo -e "${GREEN}Prefix already exists. Skipping.${REMOVE}"
else
  echo -e "${GREEN}Premaking the program files folder in the WINE Prefix.${REMOVE}"
  mkdir -p "$HOME/Games/HorizonXI/Prefix/pfx/drive_c/HorizonXI"
  echo -e "${GREEN}Link the donwloads folder to a location outside the prefix.${REMOVE}"
  ln -s "$HOME/Games/HorizonXI/Downloads" "$HOME/Games/HorizonXI/Prefix/pfx/drive_c/HorizonXI/Downloads"
  echo -e "${GREEN}Premaking the HorizonXI-Launcher folder in the WINE Prefix.${REMOVE}"
  mkdir -p "$HOME/Games/HorizonXI/Prefix/pfx/drive_c/users/steamuser/AppData/Roaming/HorizonXI-Launcher"
fi

pushd "$HOME/Games/HorizonXI/Prefix/pfx/drive_c/users/steamuser/AppData/Roaming/HorizonXI-Launcher" >/dev/null || exit 1

if [ -f "$HOME/Games/HorizonXI/Prefix/pfx/drive_c/users/steamuser/AppData/Roaming/HorizonXI-Launcher/config.json" ]; then
  echo -e "${GREEN}Config already exists. Skiping.${REMOVE}"
 else
  echo -e "${GREEN}Downloading the config.json.${REMOVE}"
  wget https://raw.githubusercontent.com/TeamLinux01/HorizonXI-on-Deck/main/Games/HorizonXI/Prefix/pfx/drive_c/users/steamuser/AppData/Roaming/HorizonXI-Launcher/config.json
fi

if [ -f "$HOME"/Games/HorizonXI/Prefix/pfx/drive_c/users/steamuser/AppData/Roaming/HorizonXI-Launcher/storage.json ]; then
  echo -e "${GREEN}Storage config already exists. Skiping.${REMOVE}"
else
  echo -e "${GREEN}Downloading the storage.json.${REMOVE}"
  wget https://raw.githubusercontent.com/TeamLinux01/HorizonXI-on-Deck/main/Games/HorizonXI/Prefix/pfx/drive_c/users/steamuser/AppData/Roaming/HorizonXI-Launcher/storage.json
fi

popd >/dev/null || exit 1

if [ ! -d "$HOME/Games/HorizonXI/Prefix/pfx/drive_c/HorizonXI/Game/bootloader" ]; then
  echo -e "${GREEN}Premaking the bootloader folder in the WINE Prefix.${REMOVE}"
  mkdir -p "$HOME/Games/HorizonXI/Prefix/pfx/drive_c/HorizonXI/Game/bootloader"
fi

pushd "$HOME/Games/HorizonXI/Prefix/pfx/drive_c/HorizonXI/Game/bootloader" >/dev/null || exit 1

if [ -f "$HOME/Games/HorizonXI/Prefix/pfx/drive_c/HorizonXI/Game/bootloader/d3d8.ini" ]; then
  echo -e "${GREEN}d3d8.ini already exsists. Skipping.${REMOVE}"
else
  echo -e "${GREEN}Downloading the d3d8.ini file.${REMOVE}"
  wget "https://raw.githubusercontent.com/TeamLinux01/HorizonXI-on-Deck/main/Games/HorizonXI/Prefix/pfx/drive_c/HorizonXI/Game/bootloader/d3d8.ini"
fi

if [ -f "$HOME/Games/HorizonXI/Prefix/pfx/drive_c/HorizonXI/Game/bootloader/d3d8.dll" ]; then
  echo -e "${GREEN}d3d8.dll already exists. Skipping.${REMOVE}"
else
  echo -e "${GREEN}Downloading the d3d8.dll file.${REMOVE}"
  wget "https://raw.githubusercontent.com/TeamLinux01/HorizonXI-on-Deck/main/Games/HorizonXI/Prefix/pfx/drive_c/HorizonXI/Game/bootloader/d3d8.dll"
fi

popd >/dev/null || exit 1
echo -e "${GREEN}Copying install files completed. It is safe to close the terminal.${REMOVE}"
exit 0
