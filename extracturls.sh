#!/bin/bash

while getopts "f:d:" opt; do
    case "$opt" in
        f) folder="$OPTARG" ;;
        d) domain="$OPTARG" ;;
        *) echo "Usage: $0 -f <folder> -d <domain>"; exit 1 ;;
    esac
done

if [ -z "$folder" ] || [ -z "$domain" ]; then
    echo "Usage: $0 -f <folder> -d <domain>"
    exit 1
fi

if [ ! -d "$folder" ]; then
    echo "Folder not found: $folder"
    exit 1
fi

echo "[+] Scanning: $folder"
echo "[+] Domain: $domain"

find "$folder" -type f -print0 |
while IFS= read -r -d '' file; do
    echo "[+] Processing: $file" >&2
    xurls "$file"
done |
grep -E "(^|//)([^/]*\.)?${domain//./\\.}(/|$)" |
sort -u > "${domain}_urls.txt"

echo "[+] Saved to ${domain}_urls.txt"
echo "[+] URLs: $(wc -l < "${domain}_urls.txt")"
