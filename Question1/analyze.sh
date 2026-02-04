#!/bin/bash
path=$1

if [ $# -ne 1 ]; then
    echo "Error: Exactly one argument required."
    exit 1
fi

if [ -f "$path" ]; then
    echo "Lines: $(wc -l < "$path"), Words: $(wc -w < "$path"), Chars: $(wc -m < "$path")"
elif [ -d "$path" ]; then
    total=$(ls -1 "$path" | wc -l)
    txt_files=$(ls -1 "$path"/*.txt 2>/dev/null | wc -l)
    echo "Total files: $total, .txt files: $txt_files"
else
    echo "Error: Path does not exist or is invalid."
fi
