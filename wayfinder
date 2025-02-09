#!/bin/bash

# Display ASCII Art
echo " _      _______  __  _________  _____  _______ "
echo "| | /| / / _ \ \/ / / __/  _/ |/ / _ \/ __/ _ \\"
echo "| |/ |/ / __ |\  / / _/_/ //    / // / _// , _/"
echo "|__/|__/_/ |_|/_/ /_/ /___/_/|_/____/___/_/|_| "
echo "                                               "
 
# Define the keywords for each category
declare -A keywords
keywords["xss"]="\\?q=|\\?s=|\\?search=|\\?id=|\\?lang=|\\?keyword=|\\?query=|\\?page=|\\?keywords=|\\?year=|\\?view=|\\?email=|\\?type=|\\?name=|\\?p=|\\?month=|\\?image=|\\?list_type=|\\?url=|\\?terms=|\\?categoryid=|\\?key=|\\?login=|\\?begindate=|\\?enddate="
keywords["lfi"]="\\?cat=|\\?dir=|\\?action=|\\?board=|\\?date=|\\?detail=|\\?file=|\\?download=|\\?path=|\\?folder=|\\?prefix=|\\?include=|\\?page=|\\?inc=|\\?locate=|\\?show=|\\?doc=|\\?site=|\\?type=|\\?view=|\\?content=|\\?document=|\\?layout=|\\?mod=|\\?conf="
keywords["sqli"]="\\?id=|\\?page=|\\?dir=|\\?search=|\\?category=|\\?file=|\\?class=|\\?url=|\\?news=|\\?item=|\\?menu=|\\?lang=|\\?name=|\\?ref=|\\?title=|\\?view=|\\?topic=|\\?thread=|\\?type=|\\?date=|\\?form=|\\?join=|\\?main=|\\?nav=|\\?region="
keywords["rce"]="\\?cmd=|\\?exec=|\\?command=|\\?execute=|\\?ping=|\\?query=|\\?jump=|\\?code=|\\?reg=|\\?do=|\\?func=|\\?arg=|\\?option=|\\?load=|\\?process=|\\?step=|\\?read=|\\?function=|\\?req=|\\?feature=|\\?exe=|\\?module=|\\?payload=|\\?run=|\\?print="
keywords["redir"]="\\?url=|\\?target=|\\?rurl=|\\?dest=|\\?destination=|\\?redir=|\\?redirect_url=|\\?redirect_uri=|\\?redirect=|redirect/|cgi-bin/redirect.cgi?|/out/|/out?\\?|\\?view=|/login?to=|\\?image_url=|\\?go=|\\?return=|\\?return_to=|\\?checkout_url=|\\?continue="
keywords["ssrf"]="\\?dest=|\\?redirect=|\\?uri=|\\?path=|\\?continue=|\\?url=|\\?window=|\\?next=|\\?data =|\\?reference=|\\?site=|\\?html=|\\?val=|\\?validate=|\\?domain=|\\?callback=|\\?return=|\\?page=|\\?feed=|\\?host=|\\? port=|\\?to=|\\?out=|\\?view=|\\?dir="

# Function to display the help message
usage() {
    echo "Usage: $0 [OPTIONS]"
    echo "Options:"
    echo "  --urls <domain>          Fetch URLs for the specified domain."
    echo "  --xss urls               Filter URLs for XSS vulnerabilities."
    echo "  --lfi urls               Filter URLs for LFI vulnerabilities."
    echo "  --sqli urls              Filter URLs for SQLi vulnerabilities."
    echo "  --rce urls               Filter URLs for RCE vulnerabilities."
    echo "  --redir urls             Filter URLs for redirection vulnerabilities."
    echo "  --ssrf urls              Filter URLs for SSRF vulnerabilities."
    echo "  -h, --help               Display this help message."
    exit 1
}

# Function to fetch URLs and save to a file
fetch_urls() {
    local domain=$1
    echo "Fetching URLs for domain: $domain"
    waybackurls "$domain" > urls.txt
    echo "URLs saved to urls.txt."
}

filter_urls() {
    local category=$1
    echo "Filtering URLs for category: $category"
    grep -E "${keywords[$category]}" urls.txt > "${category}.txt"
    echo "Filtered URLs saved to ${category}.txt."
}

# Parse command-line arguments
while [[ "$1" == -* ]]; do
    case "$1" in
        --urls) fetch_urls "$2"; shift ;;
        --xss) filter_urls "xss"; shift ;;
        --lfi) filter_urls "lfi"; shift ;;
        --sqli) filter_urls "sqli"; shift ;;
        --rce) filter_urls "rce"; shift ;;
        --redir) filter_urls "redir"; shift ;;
        --ssrf) filter_urls "ssrf"; shift ;;
        --output-dir) output_dir="$2"; shift ;;
        --verbose) verbose=true ;;
        --custom-pattern) custom_pattern="$2"; shift ;;
        -h|--help) usage ;;
        *) echo "Invalid option: $1"; usage ;;
    esac
    shift
done

# Finalize the script execution
echo "Script execution completed."
