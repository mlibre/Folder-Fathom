#!/bin/bash

# Check if argument is provided
if [ $# -ne 1 ]; then
    echo "Usage: $0 <folder_path>"
    exit 1
fi

# Check if folder exists
if [ ! -d "$1" ]; then
    echo "Folder not found: $1"
    exit 1
fi

# Define output file
output_file="output.txt"

# Remove existing output file
> "$output_file"

# Function to traverse folder recursively
traverse_folder() {
    local folder="$1"

    # Print folder structure
    tree_output=$(tree "$folder" -I 'node_modules' 2>/dev/null)
    if [ -n "$tree_output" ]; then
        echo "
[ Section Start: Project files and folders structure ]" >> "$output_file"
        echo "$tree_output" >> "$output_file"
        echo "" >> "$output_file"
    fi

    # Loop through files in current folder
    find "$folder" -type f ! -path '*/.*' ! -path "*/node_modules/*" | while read -r file; do
        # Print file structure and content
        echo "
[ file: $file ]" >> "$output_file"
        echo "\`\`\`$(file_extension "$file")" >> "$output_file"
        cat "$file" >> "$output_file"
        echo "\`\`\`" >> "$output_file"
    done
}

# Function to get file extension
file_extension() {
    local file="$1"
    echo "${file##*.}"
}

traverse_folder "$1"

echo "Output saved to $output_file"