<h1 align=center> UNDER DEVELOPMENT </h1>
<h1 align=center> Way Finder </h1>
A powerful Bash-based URL filtering and vulnerability detection tool for bug bounty hunters.

## **Description**  
Way Finder is a lightweight Bash script designed to assist bug bounty hunters in automating reconnaissance tasks. It allows users to fetch URLs from web archives, filter them for specific vulnerability parameters, and dynamically manage keyword-based searches. Whether you're hunting for XSS, LFI, SQLi, or other vulnerabilities, [Tool Name] is here to streamline your workflow.

---

## **Features**  
- **Fetch URLs:** Extract URLs from the Wayback Machine for a given domain.  
- **Filter URLs:** Search for specific vulnerability patterns such as XSS, SQLi, SSRF, and more.  
- **Add Keywords:** Dynamically add custom keywords for vulnerability searches.  
- **Custom Output:** Save results to organized output files.  
- **Help Menu:** Access all available commands and usage details.

---

## **Installation**  
1. Clone the repository:  
   ```bash
   git clone https://github.com/yourusername/tool-name.git
   cd tool-name
   ```

2. Make the script executable:  
   ```bash
   chmod +x tool
   ```

3. Ensure you have `waybackurls` installed:  
   ```bash
   go install github.com/tomnomnom/waybackurls@latest
   ```

---

## **Usage**  

Run the tool with the desired flags and arguments. Below is a list of all supported options:

| **Flag**             | **Description**                                         | 
|----------------------|---------------------------------------------------------|
| `--urls`             | Fetch URLs from Wayback Machine for a given domain.     | 
| `--xss`              | Filter URLs containing XSS-related parameters.          | 
| `--lfi`              | Filter URLs for Local File Inclusion patterns.          | 
| `--sqli`             | Filter URLs for SQL Injection patterns.                 |
| `--redir`            | Filter URLs for Open Redirect patterns.                 | 
| `--ssrf`             | Filter URLs for Server-Side Request Forgery patterns.   | 
| `--rce`              | Filter URLs for Remote Code Execution patterns.         | 
| `--add`              | Add a custom keyword to a vulnerability type filter.    | 
| `-d`                 | Specify the domain for URL collection.                  |
| `-f`                 | Specify the input file for URL filtering.               | 
| `-o`                 | Specify the output file to save results.                | 
| `--help`             | Display the help menu with all available options.       | 

---

## **Examples**  

### 1. Fetch URLs for a domain:  
   ```bash
   tool --urls -d example.com -o waybackurls.txt
   ```

### 2. Filter URLs for XSS parameters:  
   ```bash
   tool --xss -f waybackurls.txt -o xss_urls.txt
   ```

### 3. Add a custom keyword to the XSS filter:  
   ```bash
   tool --add --xss "<iframe"
   ```

### 4. Filter URLs for SQL Injection:  
   ```bash
   tool --sqli -f urls.txt -o sqli_urls.txt
   ```

### 5. Display help menu:  
   ```bash
   tool --help
   ```  

---

## **License**  
This project is licensed under the MIT License.  

---

# Stage 1: Core URL Collection Functionality
## Goal: Implement the ability to fetch and save URLs using waybackurls.

### Algorithm:

1. Parse command-line arguments (`--urls`, `-d`, `-o`).
2. Validate inputs:
   - Ensure `-d` (domain) and `-o` (output file) are provided.
   - Check if waybackurls is installed.
3. Run waybackurls with the domain and save the results to the specified output file.
4. Display a success message or error if the command fails.

### Tasks:

Task 1: Create a function to handle argument parsing.
Task 2: Validate inputs and check prerequisites (e.g., waybackurls is installed).
Task 3: Run waybackurls and save the output to a file.

---
