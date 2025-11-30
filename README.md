# 🔍 Super Recon – Automated Reconnaissance Tool

Super Recon is an automated reconnaissance tool written in **Bash**, designed for ethical hacking, bug bounty hunting, and OSINT-based target mapping. The tool performs **subdomain enumeration, live host detection, and port/service scanning** in a single seamless workflow — saving all results in an organized folder structure with timestamps.

---

## ✨ Features

| Phase                   | Tool Used        | Purpose                                                    |
| ----------------------- | ---------------- | ---------------------------------------------------------- |
| Subdomain Enumeration   | Subfinder, Amass | Discover hidden and public subdomains                      |
| Live Host Detection     | Httprobe         | Identify which subdomains are responding to HTTP/HTTPS     |
| Port & Service Scanning | Nmap             | Detect open ports, running services, and software versions |
| Report Organization     | Bash             | Save findings automatically in `recon_results/`            |

Every execution stores results in a **new timestamped folder**, ensuring clean history and proper report tracking.

---

## ⚙️ Installation & Requirements

Before running Super Recon, install the following packages:

```bash
sudo apt install nmap -y
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
go install -v github.com/OWASP/Amass/v3/...@master
go install -v github.com/tomnomnom/httprobe@latest
```

Ensure `GOPATH` binaries are exported:

```bash
export PATH=$PATH:~/go/bin
```

---

## 🚀 Usage

Run the tool using:

```bash
chmod +x super_recon.sh
./super_recon.sh <domain>
```

Example:

```bash
./super_recon.sh tesla.com
```

---

## 📁 Output Structure

All results are saved automatically in:

```
recon_results/<domain>-YYYY-MM-DD_HH-MM-SS/
```

Example folder contents:

```
subfinder.txt       → Subfinder raw results  
amass.txt           → Amass raw results  
subdomains.txt      → Combined + sorted unique subdomains  
live_hosts.txt      → Filtered active hosts  
nmap_scan.txt       → Full Nmap service scan results
```

---

## 🖥️ Sample Execution Output

```
===============================================
       SUPER RECON - AUTOMATED SCANNER
        Created by: Abhishek P Nair
===============================================

[+] Target domain : tesla.com
[+] Step 1: Subdomain Enumeration...
[+] Step 2: Live Host Detection...
[+] Step 3: Nmap Port Scanning...
[+] Recon completed successfully!
[+] Results saved to: recon_results/tesla.com-2025-11-30_15-42-10
```

---

## ⚠️ Legal Disclaimer

This tool is created **strictly for educational and ethical security testing purposes only**.

You may **only run this script on:**
✔ Systems you own
✔ Systems you have written permission to test

Unauthorized scanning of external domains **may be illegal**. Neither the author nor contributors are responsible for misuse.

---

## 🤝 Contribution

Feel free to submit pull requests to improve:

* Performance
* Integration with other recon tools (e.g., Naabu, FFUF)
* UI enhancements / progress bars
* Report generator (HTML/CSV/PDF export)

---

## ⭐ Support the Project

If you found this tool useful, consider giving the GitHub repository a **star ⭐** to support the project and encourage future updates.

---

### 👨‍💻 Author

**Abhishek P Nair**
Cyber Security Researcher | Ethical Hacker


