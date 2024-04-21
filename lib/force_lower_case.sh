#!/bin/bash
# Standalong util
# Checks all directories/sub directories to enforce
# lower case standardization for the first letter of any folder

count=0

while IFS= read -r dir; do
    dirname=$(basename "$dir")
    if [[ $dirname =~ ^[A-Z] ]]; then
        echo "❌ Uppercase starting letter found: $dir"
        count=$((count + 1))
    fi
done < <(find . -type d ! -path "./.git/*" ! -path ".")

if [ "$count" -ne 0 ]; then
    exit 1
else
    echo "✅ All directories have lowercase starting letters."
fi
