#!/bin/bash

# Directory where files will be created
TARGET_DIR="./my-files"

# Create target directory if it doesn't exist
mkdir -p "$TARGET_DIR"

echo "Creating 20 random files in $TARGET_DIR..."

for ((i=1; i<=20; i++)); do
  # Generate a random filename (10 random characters)
  FILE_NAME=$(tr -dc 'a-zA-Z0-9' </dev/urandom | head -c 10).txt
  touch "$TARGET_DIR/$FILE_NAME"
  echo "Random file content $i" > "$TARGET_DIR/$FILE_NAME"
  echo "Created: $TARGET_DIR/$FILE_NAME"
done

echo "Completed creating 20 random files."
