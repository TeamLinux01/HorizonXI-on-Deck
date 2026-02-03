#!/bin/bash
version=1.9.2

if [ -d "$HOME/Games/HorizonXI/Launcher" ]; then
  echo "Launcher folder already exists, running remove command on it. Press y to remove it when asked."
  rm -Ivr "$HOME/Games/HorizonXI/Launcher"
fi
mkdir -p "$HOME/Games/HorizonXI/"{Downloads,Launcher/download,Prefix}
pushd "$HOME/Games/HorizonXI/Launcher/download" || exit 1
wget -c https://github.com/HorizonFFXI/HorizonXI-Launcher-Binaries/releases/download/v$version/HorizonXI-Launcher-$version.Setup.exe && \
7z x HorizonXI-Launcher-$version.Setup.exe && \
7z x HorizonXI_Launcher-$version-full.nupkg && \
mv lib/net45/* "$HOME/Games/HorizonXI/Launcher/"
popd || exit 1
if [ ! -d "$HOME/Games/HorizonXI/Prefix/pfx" ]; then
  mkdir -p "$HOME/Games/HorizonXI/Prefix/pfx/drive_c/Program Files (x86)/HorizonXI"
  ln -s "$HOME/Games/HorizonXI/Downloads" "$HOME/Games/HorizonXI/Prefix/pfx/drive_c/Program Files (x86)/HorizonXI/Downloads"
  mkdir -p "$HOME/Games/HorizonXI/Prefix/pfx/drive_c/users/steamuser/AppData/Roaming/HorizonXI-Launcher"
  pushd "$HOME/Games/HorizonXI/Prefix/pfx/drive_c/users/steamuser/AppData/Roaming/HorizonXI-Launcher" || exit 1
  if [ ! -f "$HOME/Games/HorizonXI/Prefix/pfx/drive_c/users/steamuser/AppData/Roaming/HorizonXI-Launcher/config.json" ]; then
    wget https://raw.githubusercontent.com/TeamLinux01/HorizonXI-on-Deck/main/Games/HorizonXI/Prefix/pfx/drive_c/users/steamuser/AppData/Roaming/HorizonXI-Launcher/config.json
  fi
  if [ ! -f "$HOME"/Games/HorizonXI/Prefix/pfx/drive_c/users/steamuser/AppData/Roaming/HorizonXI-Launcher/storage.json ]; then
    wget https://raw.githubusercontent.com/TeamLinux01/HorizonXI-on-Deck/main/Games/HorizonXI/Prefix/pfx/drive_c/users/steamuser/AppData/Roaming/HorizonXI-Launcher/storage.json
  fi
  popd || exit 1
fi
echo "Copying install files completed. It is safe to close the terminal."
exit 0
