#!/usr/bin/env sh

BOLD='\033[0;1m'
echo "$${BOLD}Installing filebrowser..."

curl -fsSL https://raw.githubusercontent.com/filebrowser/get/master/get.sh | bash

echo "🥳 Installation comlete!"

echo "👷 Starting filebrowser in background..."

FOLDER=${FOLDER/\~/$HOME}

filebrowser --noauth --root $FOLDER --port ${PORT} >${LOG_PATH} 2>&1 &

echo "check logs at ${LOG_PATH}"
