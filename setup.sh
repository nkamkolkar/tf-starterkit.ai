#!/bin/bash
set -e

# --- Part 1: Run with sudo (Installs and configures system) ---
if [ "$EUID" -ne 0 ]; then
  echo "INFO: Installing dependencies. Please run with sudo."
  sudo "$0" # Rerun the script with sudo
  exit
fi

log_info() { echo "INFO: $1"; }

log_info "Updating system packages and installing dependencies..."
apt-get update -y
apt-get install -y git docker.io docker-compose-plugin

log_info "Creating user '$USERNAME'..."
if ! id "n8n-service" &>/dev/null; then
  useradd -m -s /bin/bash "n8n-service"
fi
usermod -aG docker n8n-service
usermod -aG sudo n8n-service

log_info "Setup is complete. Please log in as n8n-service to continue."
exit 0
