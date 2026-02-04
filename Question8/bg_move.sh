#!/bin/bash
dir_path=$1

# Check for valid directory argument
if [ ! -d "$dir_path" ]; then
    echo "Error: Directory not found."
    exit 1
fi

mkdir -p "$dir_path/backup"

echo "Starting background move operations..."

for file in "$dir_path"/*; do
    if [ -f "$file" ]; then
        # Move file in background using &
        mv "$file" "$dir_path/backup/" &
        # $! captures the PID of the last background process
        echo "Moving $(basename "$file") - PID: $!"
    fi
done

# Wait for all background tasks to finish
wait
echo "All backup operations completed successfully."
