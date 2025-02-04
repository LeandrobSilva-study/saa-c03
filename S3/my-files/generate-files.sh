#!/usr/bin/env bash

# Directory where files will be created
TARGET_DIR="./my-files"

# Create target directory if it doesn't exist
mkdir -p "$TARGET_DIR"

# Generate a random number between 5 and 10
FILE_COUNT=$((RANDOM % 6 + 5))

echo "Creating $FILE_COUNT files in $TARGET_DIR..."

for ((i=1; i<=FILE_COUNT; i++)); do
  FILE_NAME="file_$i.txt"
  touch "$TARGET_DIR/$FILE_NAME"
  echo "This is file number $i" > "$TARGET_DIR/$FILE_NAME"
  echo "Created: $TARGET_DIR/$FILE_NAME"
done

echo "Completed creating $FILE_COUNT files."
