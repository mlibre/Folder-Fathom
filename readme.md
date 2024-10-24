# Folder-Fathom

Welcome to **Folder-Fathom**! This humble script is here to lend you a hand when you're exploring the depths of a folder's structure and content. It's not flashy, but it gets the job done with a touch of fun!

## Usage

To embark on the journey of folder exploration, simply run the script with the folder path as the only argument:

```bash
git clone https://github.com/mlibre/Folder-Fathom
cd Folder-Fathom
chmod +x install.sh
./install.sh

folderFanthom <folder_path> [output_file] [--include-file-info]
# Or
script.bash <folder_path> [output_file] [--include-file-info]

# Examples:
folderFanthom .
./script.bash /home/user/Documents/folder_to_explore output.txt
./script.bash /home/user/Documents/folder_to_explore output.txt --include-file-info
```

## Features

- **Folder Structure Overview**: Ever felt lost in a labyrinth of folders? Fear not! This script provides a clear map of the folder structure, helping you find your way.
- **Content Inspection**: Dive deep into the files within the folders. See their extensions, their contents, and unravel their mysteries.

## Installation

To make Folder-Fathom available system-wide, use the provided `install.sh` script. After cloning the repository, navigate to the `Folder-Fathom` directory and execute the following command:

```bash
sudo curl -sSL https://raw.githubusercontent.com/mlibre/Folder-Fathom/main/direct-install.sh | bash
```

Or, if you prefer, you may install the script manually:

```bash
git clone https://github.com/mlibre/Folder-Fathom
cd Folder-Fathom
chmod +x install.sh
./install.sh
```

## Uninstallation

```bash
chmod +x uninstall.bash
./uninstall.bash
```

## Dependencies

- `tree`: For visualizing the folder structure.
- `bash`: Well, it's a bash script after all!

## Donate :heartpulse:

ETH:
> 0xc9b64496986E7b6D4A68fDF69eF132A35e91838e

Now, go forth and explore those folders with a humble bash script as your guide. Happy exploring! 🚀📁
