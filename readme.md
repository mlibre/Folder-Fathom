# Folder-Fathom

Welcome to **Folder-Fathom**! This humble script is here to lend you a hand when you're exploring the depths of a folder's structure and content. It's not flashy, but it gets the job done with a touch of fun!

## Usage

To embark on the journey of folder exploration, simply run the script with the folder path as the only argument:

```bash
git clone https://github.com/mlibre/Folder-Fathom
cd Folder-Fathom
chmod +x install.sh
./install.sh

folderFathom <folder_path> [output_file]
# Or
script.bash <folder_path> [output_file]
```

### Examples

```bash
# Explore the current directory and save the output to output.txt
folderFathom .

# Explore a specific directory and save to a custom output file
./script.bash /home/user/Documents/folder_to_explore output.txt

# Explore a specific directory with custom output, using the default output file
./script.bash /home/user/Documents/folder_to_explore
```

## Features

- **Folder Structure Overview**: Ever felt lost in a labyrinth of folders? Fear not! This script provides a clear map of the folder structure, helping you find your way.
- **Content Inspection**: Dive deep into the files within the folders. See their extensions, their contents, and unravel their mysteries.
- **Ignore Patterns Support**: Automatically excludes files and directories listed in `.ignore` and `.gitignore` files, making it easier to focus on relevant content.

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

To uninstall, run:

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
