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

# **Stage 2: Basic Filtering by Vulnerability Type**

## **Goal:** Implement keyword-based filtering for specific vulnerability types.

### **Algorithm:**

1.  Parse command-line arguments (`--xss`, `--lfi`, etc., with `-f` and `-o`).
2.  Validate inputs:
    - Ensure `-f` (input file) and `-o` (output file) are provided.
    - Check if the input file exists.
3.  Based on the chosen vulnerability type:
    - Use `grep` to search for predefined keywords in the input file.
    - Save matching URLs to the output file.
4.  Provide success or error messages.

**Tasks:**

- Task 1: Define predefined keyword lists for each vulnerability type (e.g., XSS, LFI).
- Task 2: Implement keyword filtering using `grep`.
- Task 3: Write functions for each vulnerability type (e.g., `filter_xss`, `filter_lfi`).

---

### **Stage 3: Add Dynamic Keyword Management**  
**Goal:** Allow users to add new keywords for vulnerability-specific filters.

**Algorithm:**  
1. Parse command-line arguments (`--add`, vulnerability type, keyword).  
2. Validate inputs:
   - Ensure vulnerability type (`--xss`, `--lfi`, etc.) is valid.
   - Check if a keyword is provided.
3. Append the new keyword to the corresponding keyword list (stored in a file or array).  
4. Confirm that the keyword has been added successfully.

**Tasks:**  
- Task 1: Store keyword lists in external files or a configuration file for persistence.  
- Task 2: Write functions to add keywords dynamically.  
- Task 3: Update filtering logic to include custom keywords.  

---

### **Stage 4: Modularize and Optimize Code**  
**Goal:** Organize the script into reusable functions and enhance usability.

**Algorithm:**  
1. Create modular functions:
   - `parse_arguments()`: Handle argument parsing.
   - `run_waybackurls()`: Fetch URLs.
   - `filter_urls()`: Filter URLs based on type.
   - `add_keyword()`: Add new keywords.
2. Use `case` or `if-elif` blocks to handle different operations (`--urls`, `--xss`, etc.).
3. Validate all inputs and provide meaningful error messages for invalid usage.
4. Include a help menu with usage instructions.

**Tasks:**  
- Task 1: Modularize all operations into functions.  
- Task 2: Add input validation for robustness.  
- Task 3: Write a `--help` menu with descriptions of all options.

---

### **Stage 5: Extend Functionality for More Vulnerabilities**  
**Goal:** Add more filtering options for vulnerabilities like SSRF, RCE, etc.

**Algorithm:**  
1. Define keyword lists for new vulnerabilities.  
2. Implement functions for filtering additional vulnerabilities (`filter_ssrf`, `filter_rce`).  
3. Integrate these functions into the main script.

**Tasks:**  
- Task 1: Research common patterns and keywords for new vulnerabilities.  
- Task 2: Add functions and keywords for new vulnerability types.  
- Task 3: Test and refine new features.

---

### **Stage 6: Advanced Features**  
**Goal:** Enhance usability and functionality.

**Possible Additions:**  
1. **Output Formatting:** Save results in structured formats like CSV or JSON.  
2. **Multithreading:** Use `xargs` or `parallel` for faster filtering.  
3. **Custom Commands:** Allow users to define and run custom grep commands.  
4. **Logging:** Implement logging for errors and operations.  
5. **Interactive Mode:** Add an interactive menu for non-CLI users.

---

By dividing the development into these stages, you can build and test each feature incrementally, ensuring a robust and functional tool. Let me know if you need a starting script or more details! 😊
