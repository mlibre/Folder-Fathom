#!/bin/bash

# Check if arguments are provided
if [ $# -lt 1 ] || [ $# -gt 2 ]; then
   echo "Usage: $0 <folder_path> [output_file]"
   echo "Example: $0 ~/Documents/ output.txt"
   echo "Example: $0 . output.txt"
   exit 1
fi

# Check if folder exists
if [ ! -d "$1" ]; then
   echo "Folder not found: $1"
   exit 1
fi

output_file=${2:-output.txt}

# Remove old output file if it exists
[ -f "$output_file" ] && rm "$output_file"

# Function to read ignore patterns from .ignore and .gitignore
read_ignore_patterns() {
   local folder="$1"
   local patterns=()
   
   # Read .ignore file if it exists
   if [ -f "$folder/.ignore" ]; then
      mapfile -t patterns < "$folder/.ignore"  # Read all lines into the array
   fi
   
   # Read .gitignore file if it exists
   if [ -f "$folder/.gitignore" ]; then
      mapfile -t git_patterns < "$folder/.gitignore"  # Read all lines into the array
      patterns+=("${git_patterns[@]}")  # Combine gitignore patterns with other patterns
   fi
   
   # Format patterns for find command
   local find_excludes=""
   for pattern in "${patterns[@]}"; do
      # Escape special characters for find command
      escaped_pattern=$(printf '%s\n' "$pattern" | sed 's/[\/&]/\\&/g')
      find_excludes+="! -path \"*$escaped_pattern\" "
   done
   
   echo "$find_excludes"
}

# Function to traverse folder recursively
traverse_folder() {
   local folder="$1"
   local output_data=""
   
   # Get ignore patterns
   local find_excludes
   find_excludes=$(read_ignore_patterns "$folder")
   
   # Print folder structure excluding node_modules and hidden files
   tree_output=$(tree "$folder" -I 'node_modules' 2>/dev/null)
   if [ -n "$tree_output" ]; then
      output_data+="\n[# Project Files and Folders Structure #]\n"
      output_data+="\`\`\`text\n"
      output_data+="$tree_output\n"
      output_data+="\`\`\`\n"
      output_data+="[# End of Project Files and Folders Structure #]\n"
   fi
   
   # Prepare the find command
   local find_command="find \"$folder\" -type f ! -path '*/.*' ! -path '*/node_modules/*' $find_excludes"
   
   # Log the find command for debugging
   echo "Executing command: $find_command"
   
   # Loop through files in current folder with dynamic exclusion
   while IFS= read -r file; do
      local file_ext=$(file_extension "$file")
      output_data+="\n[## File: $file ##]\n"
      output_data+="\`\`\`${file_ext}\n$(cat "$file")\n\`\`\`\n"
      output_data+="[## End of File: $file ##]\n"
   done < <(eval "$find_command")
   
   echo -e "$output_data" > "$output_file"
}

# Function to get file extension
file_extension() {
   local file="$1"
   echo "${file##*.}"
}

traverse_folder "$1"
