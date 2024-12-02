function showhelp() {
    echo "Usage: $0 [options]"
    echo "Options:"
    echo "  --urls          Fetch URLs from the Wayback Machine for a domain."
    echo "  -d <domain>     Specify the target domain."
    echo "  -o <file>       Specify the output file to save URLs."
    echo "  --help          Display this help menu."
}

while [[ $# -gt 0 ]]; do
    case $1 in
        --urls)
            FETCH_URLS=true
            shift
            ;;
        -d)
            DOMAIN=$2
            shift 2
            ;;
        -o)
            OUTPUT_FILE=$2
            shift 2
            ;;
        --help)
            showhelp
            exit 0
            ;;
        *)
            echo "Unknown option: $1"
            showhelp
            exit 1
            ;;
    esac
done

if [[ $FETCH_URLS && -z $DOMAIN ]]; then
    echo "Error: --urls requires -d <domain>."
    showhelp
    exit 1
fi

if [[ $FETCH_URLS && -z $OUTPUT_FILE ]]; then
    echo "Error: --urls requires -o <file>."
    showhelp
    exit 1
fi
