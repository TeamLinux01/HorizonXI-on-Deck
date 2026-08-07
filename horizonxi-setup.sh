#!/bin/bash
version=2.0.0

if [ -d "$HOME/Games/HorizonXI/Launcher" ]; then
  echo "Launcher folder already exists, running remove command on it. Press y to remove it when asked."
  rm -Ivr "$HOME/Games/HorizonXI/Launcher"
fi
mkdir -p "$HOME/Games/HorizonXI/"{Downloads,Launcher/download,Prefix}
pushd "$HOME/Games/HorizonXI/Launcher/download" || exit 1
echo "Downloading and extacting the launcher."
wget -c https://github.com/HorizonFFXI/HorizonXI-Launcher-Binaries/releases/download/v$version/HorizonXI-Launcher-$version.Setup.exe && \
7z x HorizonXI-Launcher-$version.Setup.exe && \
7z x HorizonXI_Launcher-$version-full.nupkg && \
mv lib/net45/* "$HOME/Games/HorizonXI/Launcher/" && \
echo "Completed launch placement."
popd || exit 1
if [ ! -d "$HOME/Games/HorizonXI/Prefix/pfx" ]; then
  echo "Premaking the program files folder in the WINE Prefix."
  mkdir -p "$HOME/Games/HorizonXI/Prefix/pfx/drive_c/Program Files (x86)/HorizonXI"
  echo "Link the donwloads folder to a location outside the prefix"
  ln -s "$HOME/Games/HorizonXI/Downloads" "$HOME/Games/HorizonXI/Prefix/pfx/drive_c/Program Files (x86)/HorizonXI/Downloads"
  echo "Premaking the HorizonXI-Launcher folder in the WINE Prefix."
  mkdir -p "$HOME/Games/HorizonXI/Prefix/pfx/drive_c/users/steamuser/AppData/Roaming/HorizonXI-Launcher"
  pushd "$HOME/Games/HorizonXI/Prefix/pfx/drive_c/users/steamuser/AppData/Roaming/HorizonXI-Launcher" || exit 1
  if [ ! -f "$HOME/Games/HorizonXI/Prefix/pfx/drive_c/users/steamuser/AppData/Roaming/HorizonXI-Launcher/config.json" ]; then
    echo "Downloading the config.json"
    wget https://raw.githubusercontent.com/TeamLinux01/HorizonXI-on-Deck/main/Games/HorizonXI/Prefix/pfx/drive_c/users/steamuser/AppData/Roaming/HorizonXI-Launcher/config.json
  fi
  if [ ! -f "$HOME"/Games/HorizonXI/Prefix/pfx/drive_c/users/steamuser/AppData/Roaming/HorizonXI-Launcher/storage.json ]; then
    echo "Downloading the storage.json"
    wget https://raw.githubusercontent.com/TeamLinux01/HorizonXI-on-Deck/main/Games/HorizonXI/Prefix/pfx/drive_c/users/steamuser/AppData/Roaming/HorizonXI-Launcher/storage.json
  fi
  popd || exit 1
fi
if [ ! -d "$HOME/Games/HorizonXI/Prefix/pfx/drive_c/Program Files (x86)/HorizonXI/Game/bootloader" ]; then
  echo "Premaking the bootloader folder in the WINE Prefix"
  mkdir -p "$HOME/Games/HorizonXI/Prefix/pfx/drive_c/Program Files (x86)/HorizonXI/Game/bootloader"
fi
pushd "$HOME/Games/HorizonXI/Prefix/pfx/drive_c/Program Files (x86)/HorizonXI/Game/bootloader" || exit 1
if [ ! -f "$HOME/Games/HorizonXI/Prefix/pfx/drive_c/Program Files (x86)/HorizonXI/Game/bootloader/d3d8.ini" ]; then
  echo "Downloading the d3d8.ini file"
  wget "https://raw.githubusercontent.com/TeamLinux01/HorizonXI-on-Deck/main/Games/HorizonXI/Prefix/pfx/drive_c/Program%20Files%20(x86)/HorizonXI/Game/bootloader/d3d8.ini"
fi
if [ ! -f "$HOME/Games/HorizonXI/Prefix/pfx/drive_c/Program Files (x86)/HorizonXI/Game/bootloader/d3d8.dll" ]; then
  echo "Downloading the d3d8.dll file"
  wget "https://raw.githubusercontent.com/TeamLinux01/HorizonXI-on-Deck/main/Games/HorizonXI/Prefix/pfx/drive_c/Program%20Files%20(x86)/HorizonXI/Game/bootloader/d3d8.dll"
fi
popd || exit 1
echo "Copying install files completed. It is safe to close the terminal."
exit 0
