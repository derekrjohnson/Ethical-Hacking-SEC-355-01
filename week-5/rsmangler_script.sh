#!/bin/bash

# Check if input file is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <input_file>"
    exit 1
fi

input_file="$1"
base_name="$(basename "$input_file" .txt)"
n=1

# Read each word from the input file
while IFS= read -r word; do
    output_file="${base_name}_${n}.txt"
    echo "$word" | rsmangler -f /dev/stdin -o "$output_file"
    ((n++))
done < "$input_file"

echo "Processing complete. Output files are named ${base_name}_<n>.txt"
