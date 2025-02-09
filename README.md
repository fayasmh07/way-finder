
<h1 align=center> WAY FINDER </h1>
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
| `-h, --help`             | Display the help menu with all available options.       | 

---

## **Examples**  

### 1. Fetch URLs for a domain:  
   ```bash
   tool --urls example.com
   ```

### 2. Filter URLs for XSS parameters:  
   ```bash
   tool --xss urls.txt
   ```

### 3. Filter URLs for SQL Injection:  
   ```bash
   tool --sqli urls.txt 
   ```

### 4. Display help menu:  
   ```bash
   tool --help
   ```  

---

## **License**  
This project is licensed under the MIT License.  

---
