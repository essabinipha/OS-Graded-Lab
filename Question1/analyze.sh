#!/bin/bash
path=$1

if [ $# -ne 1 ]; then
    echo "Error: usage ./analyze.sh <file_or_dir>"
    exit 1
fi

if [ -f "$path" ]; then
    echo "File stats for $path:"
    echo "Lines: $(wc -l < "$path")"
    echo "Words: $(wc -w < "$path")"
    echo "Chars: $(wc -m < "$path")"
elif [ -d "$path" ]; then
    echo "Directory stats for $path:"
    echo "Total files: $(ls -1 "$path" | wc -l)"
    echo "Text files (.txt): $(ls -1 "$path"/*.txt 2>/dev/null | wc -l)"
else
    echo "Error: path not found"
fi
