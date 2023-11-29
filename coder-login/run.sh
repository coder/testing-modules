#!/usr/bin/env sh

# Automatically authenticate the user if they are not
# logged in to another deployment

BOLD='\033[0;1m'
RESET='\033[0m'

# Convert templated variables to shell variables
CODER_DEPLOYMENT_URL=${CODER_DEPLOYMENT_URL}
CODER_USER_TOKEN=${CODER_USER_TOKEN}

printf "$${BOLD}Logging into Coder...\n\n$${RESET}"

if ! coder list > /dev/null 2>&1; then
  set +x
  coder login --token="$${CODER_USER_TOKEN}" --url="$${CODER_DEPLOYMENT_URL}"
else
  echo "You are already authenticated with coder."
fi
