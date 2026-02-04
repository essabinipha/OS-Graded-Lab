#!/bin/bash
log_file=$1

# Basic check to see if the file exists
if [ ! -f "$log_file" ]; then
    echo "Error: file not found"
    exit 1
fi

# Counting occurrences using grep -c
total=$(wc -l < "$log_file")
info=$(grep -c "INFO" "$log_file")
warn=$(grep -c "WARNING" "$log_file")
err=$(grep -c "ERROR" "$log_file")
last_err=$(grep "ERROR" "$log_file" | tail -1)

# Output results to terminal
echo "Total Entries: $total"
echo "INFO: $info | WARNING: $warn | ERROR: $err"
echo "Most Recent Error: $last_err"

# Saving a summary report with today's date
report="logsummary_$(date +%Y-%m-%d).txt"
echo "Summary for $log_file" > "$report"
echo "Total: $total | INFO: $info | ERRORS: $err" >> "$report"
