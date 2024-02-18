#!/bin/bash

directory_count=0
file_count=0

for entry in *; do
    if [ -d "$entry" ]; then
        ((directory_count++))
    elif [ -f "$entry" ]; then
        ((file_count++))
    fi
done

echo "Number of directories: $directory_count"
echo "Number of files: $file_count"
