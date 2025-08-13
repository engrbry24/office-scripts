#!/bin/bash

"QQ_COMMAND" login -u "your_user_here" -p "your_password_here"

# Set the base directory where the logs are saved
SOURCE_DIR="/home/admin"

# Define Qumulo SMB destination folder
DEST_DIR="/M1/MAMS_ROOT/MAMS_TST/FROM_IT/Logs/" 

# Find the newest file (sorted by modification time)
newest_file=$(ls -t "$SOURCE_DIR" | head -n 1) 

# Full path to the newest file
Full_path="$SOURCE_DIR/$newest_file" 

# Use fs_write to copy the file to Qumulo
"QQ_COMMAND" fs_write --path "$DEST_DIR/$newest_file" --file "$Full_path" --create 