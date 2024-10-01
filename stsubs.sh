#!/bin/bash

echo " ░▒▓███████▓▒░▒▓████████▓▒░▒▓███████▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓███████▓▒░ ░▒▓███████▓▒░ "
echo "░▒▓█▓▒░         ░▒▓█▓▒░  ░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░        "
echo "░▒▓█▓▒░         ░▒▓█▓▒░  ░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░        "
echo " ░▒▓██████▓▒░   ░▒▓█▓▒░   ░▒▓██████▓▒░░▒▓█▓▒░░▒▓█▓▒░▒▓███████▓▒░ ░▒▓██████▓▒░  "
echo "       ░▒▓█▓▒░  ░▒▓█▓▒░         ░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░      ░▒▓█▓▒░ "
echo "       ░▒▓█▓▒░  ░▒▓█▓▒░         ░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░      ░▒▓█▓▒░ "
echo "░▒▓███████▓▒░   ░▒▓█▓▒░  ░▒▓███████▓▒░ ░▒▓██████▓▒░░▒▓███████▓▒░░▒▓███████▓▒░  "
echo ""

RED='\033[0;31m'
NC='\033[0m'

if [ -z "$stapikey" ]; then
  echo -e "${RED}Error: API key (stapikey) not set in the environment.${NC}"
  exit 1
fi

if [ -z "$1" ]; then
  echo -e "${RED}Error: No domain provided.${NC}"
  exit 1
fi

curl --request GET --url "https://api.securitytrails.com/v1/domain/$1/subdomains?children_only=false&include_inactive=true" \
  -H "accept: application/json" \
  -H "apikey: $stapikey" | \
  jq .subdomains[] | cut -d'"' -f 2 | sed "s/$/\.${1}/"
