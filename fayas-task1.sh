#!/bin/bash
#Shebang Function - tells the system to use the Bash shell to execute the script.

#Function to show usage of the tool
show_usage()
    {
        echo "$0 --urls -d domainname -o output.txt"
        echo "--urls    runs the waybackurls process"
        echo "-d        specifies the domain name"
        echo "-o        specifies the output.txt file"
    }

#Function to fetch waybackurls from the input given domain name.
fetch_urls()
    {
        local domain=$1 #local is used to declare a variable only inside this function.
        local output=$2
        
        echo "Fetching urls from $domain" #prints this sentence to know that the fetching process is ongoing.
        waybackurls "$domain" > "$output" #runs the waybackurls commands for the specified domain.

        #if block to check whether the urls fetching process executes without fail or not.
        if [[ $? -eq 0 ]]; then 
            echo "Urls fetched successfully to $output !!!"
        else
            echo "Error: Failed to fetch urls from $domain !!!"
            exit 1 #It terminates the current functions - Also it indicates that the script encounters an error.
        fi
        #'$?  is a special variable in Bash scripting which stores the exit status of the last executed command. (Here the last command is "waybackurls")
        #'-eq' is a test operator which is used to check whether two numbers are equal.
    }

#if block to check Argument Parsing
if [[ $# -lt 4 ]]; then
    show_usage
    exit 1
fi
#'$#' denaotes the total arguments parsed and '-lt' denaotes 'less than' check.

#while block to check and executes the parses
while [[ $# -gt 0 ]]; do #'-gt' does the greater than check. 
    case $1 in
        --urls) mode="urls" #if '--urls' is the first parse, 'variable' mode is set to 'urls'.
        shift #"shift" removes the current argument($1) from the list and shift all the remaning arguments one position to the left.
        ;;
        -d) domain="$2" #when the current argument($1) is '-d', then the 'domain'(domain.com/<specified domain name>) is set to '$2'.
        shift 2 #shift the remaining arguments two positions to the left, inorder to get to the '-o' as the next current argument($1).
        ;;
        -o) output="$2" #when '-o' is '$1', the 'output'(output.txt/<output file name>) is set as '$2'.
        shift 2 #here also shifts the remaining arguments two positions to the left.
        ;;
        *) echo "Unknown Argument : $1" #'*)' is the default argument. and mostly used as 'else' case.
        show_usage #shows the 'show_usage' function because of the wrong input of the argument.
        exit 1
        ;;
    esac #case closed
done #while loop closed

#if block for ensuring that necessary inputs are vaid before proceeding
if [[ mode="urls" && -n "$domain" && -n "$output" ]]; then #'&&' used as 'AND' operator; and '-n' is a non-empty operator.
    fetch_urls "$domain" "$output" #when 'if' condition is true, 'fetch_urls' function executes.
else
    show_usage #else the 'show_usage' executes.
    exit 1
fi 
