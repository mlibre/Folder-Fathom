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
rm "$output_file"

# Function to traverse folder recursively
traverse_folder() {
    local folder="$1"
    local output_data=""

    # Print folder structure
    tree_output=$(tree "$folder" -I 'node_modules' 2>/dev/null)
    if [ -n "$tree_output" ]; then
        output_data+="\n# Project Files and Folders Structure\n"
        output_data+="\`\`\`text\n"
        output_data+="$tree_output\n"
        output_data+="\`\`\`\n"
    fi

    # Loop through files in current folder
    while IFS= read -r file; do
        local file_info=$(stat --printf="Size: %s bytes\nModified: %y\n" "$file")
        local file_ext=$(file_extension "$file")
        output_data+="\n## File: $file\n"
        output_data+="### File Info\n$file_info\n"
        output_data+="\n### File Content\n"
        output_data+="\`\`\`${file_ext}\n$(cat "$file")\n\`\`\`\n"
        output_data+="\n### End of File\n"
    done < <(find "$folder" -type f ! -path '*/.*' ! -path "*/node_modules/*")

    echo -e "$output_data" > "$output_file"
}

# Function to get file extension
file_extension() {
    local file="$1"
    echo "${file##*.}"
}

traverse_folder "$1"

echo "Output saved to $output_file"
