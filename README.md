
## Description

This is a simple Bash script that uses the SecurityTrails API to enumerate subdomains of a specified domain, returning both active and inactive subdomains.

## Prerequisites

- [jq](https://stedolan.github.io/jq/) is required for parsing the JSON response from the API.
- A SecurityTrails API key, stored in an environment variable named `stapikey`.

## Usage

1. **Set the SecurityTrails API key** in your environment:
   ```bash
   export stapikey=your_securitytrails_api_key

2. **Run the script with the target domain as an argument:**
   ```bash
   ./stsubs.sh example.com > subdomains

