#!/bin/bash

# check if marks.txt exists
if [ ! -f "marks.txt" ]; then
    echo "Error: marks.txt not found"
    exit 1
fi

echo "--- Student Results ---"
while IFS=',' read -r roll name m1 m2 m3; do
    fail_count=0
    # check each subject (passing is 33)
    [ "$m1" -lt 33 ] && ((fail_count++))
    [ "$m2" -lt 33 ] && ((fail_count++))
    [ "$m3" -lt 33 ] && ((fail_count++))

    if [ "$fail_count" -eq 1 ]; then
        echo "$name: Failed in exactly one subject"
    elif [ "$fail_count" -eq 0 ]; then
        echo "$name: Passed in all subjects"
    fi
done < marks.txt
