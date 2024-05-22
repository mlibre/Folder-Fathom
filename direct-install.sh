#!/bin/bash

install_dir="/usr/local/bin"

# Download and install your script
sudo curl -o "$install_dir/folderFanthom" "https://raw.githubusercontent.com/mlibre/Folder-Fathom/main/script.bash"
sudo chmod +x "$install_dir/folderFanthom"

echo "Installation complete. You can now run 'folderFanthom' from anywhere."
