#!/bin/bash

# Define the source and backup directories
# [TASK 1] Set the target directory and destination directory to the correct values
targetDirectory="/path/to/source"  # This is where the files to be backed up are located
destinationDirectory="/path/to/backup"  # This is where the backups will be saved

# [TASK 2] Print the target and destination directory paths to the user
echo "Target Directory: $targetDirectory"
echo "Destination Directory: $destinationDirectory"

# [TASK 3] Set the currentTS variable to the current timestamp in seconds
currentTS=$(date +%s)  # This will store the current timestamp in seconds

# Print the current timestamp (optional for verification)
echo "Current Timestamp: $currentTS"

# Get the current date for naming the backup folder
DATE=$(date +"%Y-%m-%d_%H-%M-%S")

# Create the backup directory with the current date
mkdir -p "$destinationDirectory/backup_$DATE"

# Perform the backup using rsync
rsync -av --exclude="*.tmp" --exclude="*.log" "$targetDirectory/" "$destinationDirectory/backup_$DATE/"

# Check if the backup was successful
if [ $? -eq 0 ]; then
    echo "Backup completed successfully at $destinationDirectory/backup_$DATE"
else
    echo "Backup failed."
fi
