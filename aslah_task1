#!/bin/bash

# Function to display usage
usage() {
    echo "Usage: $0 -d <domain> -o <output_file>"
    exit 1
}

# Parse command-line arguments
while getopts "d:o:" opt; do
    case "$opt" in
        d) domain=$OPTARG ;;
        o) output_file=$OPTARG ;;
        *) usage ;;
    esac
done

# Validate inputs
if [[ -z "$domain" || -z "$output_file" ]]; then
    echo "Error: Domain and output file are required."
    usage
fi

# Check if waybackurls is installed
if ! command -v waybackurls &> /dev/null; then
    echo "Installing waybackurls...."
    go install github.com/tomnomnom/waybackurls@latest
    echo "Please enter the root password:"
    read -s root_passwd
    echo -e "\n\nPlease wait..."
    echo $root_passwd | sudo -S cp ~/go/bin/waybackurls /usr/local/bin
fi

# Fetch URLs using waybackurls
waybackurls "$domain" > "$output_file" &

pid=$!

sleep 10s ;kill $pid

if [[ $? -eq 0 ]]; then
    echo "URLs successfully fetched and saved to $output_file"
else
    echo "Error: Failed to fetch URLs."
    exit 1
fi
