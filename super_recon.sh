#!/bin/bash

# Super Recon - Automated Reconnaissance Tool
# Author: Abhishek P Nair
# GitHub: github.com/abhipnair/Super-Recon

echo "==============================================="
echo "       SUPER RECON - AUTOMATED SCANNER         "
echo "        Created by: Abhishek P Nair            "
echo "==============================================="
echo

if [ -z "$1" ]; then
    echo "[!] Usage: $0 <domain>"
    exit 1
fi

domain=$1
timestamp=$(date +"%Y-%m-%d_%H-%M-%S")
output_dir="recon_results/${domain}-${timestamp}"

echo "[+] Target domain : $domain"
echo "[+] Output folder : $output_dir"
echo

mkdir -p "$output_dir"

echo "[+] Step 1: Finding subdomains using Subfinder and Amass..."
subfinder -d "$domain" -silent -o "$output_dir/subfinder.txt" > /dev/null 2>&1
amass enum -passive -d "$domain" -o "$output_dir/amass.txt" > /dev/null 2>&1

cat "$output_dir/subfinder.txt" "$output_dir/amass.txt" 2>/dev/null | sort -u > "$output_dir/subdomains.txt"
echo "[+] Subdomains saved to: $output_dir/subdomains.txt"
echo

echo "[+] Step 2: Probing for live domains with httprobe..."
cat "$output_dir/subdomains.txt" | httprobe > "$output_dir/live_hosts.txt"
echo "[+] Live hosts saved to: $output_dir/live_hosts.txt"
echo

echo "[+] Step 3: Running Nmap scan on live hosts..."
nmap -iL "$output_dir/live_hosts.txt" -Pn -sV -oN "$output_dir/nmap_scan.txt" > /dev/null 2>&1
echo "[+] Nmap results saved to: $output_dir/nmap_scan.txt"
echo

echo "==============================================="
echo "[+] Recon completed successfully."
echo "[+] All results stored in: $output_dir"
echo "==============================================="
