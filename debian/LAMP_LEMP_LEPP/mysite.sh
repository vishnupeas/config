#!/bin/bash

# Define some color codes
GREEN="\033[1;32m"
BLUE="\033[1;34m"
YELLOW="\033[1;33m"
RESET="\033[0m"
CHECK="${GREEN}🍉${RESET}"
ARROW="${BLUE}🌟${RESET}"

# Function to run command and print styled output
run() {
    echo -e "${ARROW} $1"
    eval "$2" 2>&1 | tee
    echo -e "${CHECK} $3 \n"
}

# Restart PostgreSQL
run "Restarting PostgreSQL..." "sudo systemctl restart postgresql" "Restarted PostgreSQL"

# Remove all the other site configs
run "Clearing Nginx Configs..." "sudo rm /etc/nginx/sites-enabled/*" "Cleared Nginx Configs"

# Enable the current project
run "Adding sitename Nginx Configs..." "sudo ln -s /etc/nginx/sites-available/api.adidhi.test /etc/nginx/sites-enabled/" "Added sitename Nginx Configs"

# Restart Nginx web server
run "Restarting Nginx..." "sudo systemctl restart nginx" "Restarted Nginx"

# Restart PHP 8.2 fpm module
run "Restarting php8.2-fpm..." "sudo systemctl restart php8.2-fpm" "Restarted php8.2-fpm"

# Change to the project directory
cd "/home/user/work/project/sitename"
echo -e "${CHECK} Moved to CWD"

