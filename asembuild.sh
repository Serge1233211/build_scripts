#!/bin/bash

# Define folder paths (modify if needed)
SRC_FOLDER="src"
BUILD_FOLDER="build"

# Create the "build" folder (if it doesn't exist)
if [ ! -d "$BUILD_FOLDER" ]; then
  mkdir "$BUILD_FOLDER"
fi

# Loop through all assembly files in "src" folder
for file in "$SRC_FOLDER"/*.asm; do
  # Extract filename without extension
  filename="${file%.*}"

  # Assemble the file
  nasm -f elf64 "$file" -o "$BUILD_FOLDER/$filename.obj"

  # Check for errors
  if [[ $? -eq 1 ]]; then
    echo "An error occurred during assembly of '$file'."
    exit 1
  fi
done

echo "Assembly successful!"