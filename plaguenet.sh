#!/data/data/com.termux/files/usr/bin/bash

# PlagueNet - Malware Host Platform Launcher
# Author: SubzeroGPT
# Note: Educational/Red Team use only

# Banner
banner() {
clear
echo -e "\e[31m"
echo "██████╗ ██╗      █████╗  ██████╗ ██╗   ██╗███████╗███████╗████████╗"
echo "██╔══██╗██║     ██╔══██╗██╔════╝ ██║   ██║██╔════╝██╔════╝╚══██╔══╝"
echo "██████╔╝██║     ███████║██║  ███╗██║   ██║█████╗  █████╗     ██║   "
echo "██╔═══╝ ██║     ██╔══██║██║   ██║██║   ██║██╔══╝  ██╔══╝     ██║   "
echo "██║     ███████╗██║  ██║╚██████╔╝╚██████╔╝███████╗███████╗   ██║   "
echo "╚═╝     ╚══════╝╚═╝  ╚═╝ ╚═════╝  ╚═════╝ ╚══════╝╚══════╝   ╚═╝   "
echo -e "\e[0m"
echo "Welcome to PlagueNet - Modular Malware Host & Red Team Toolkit"
echo "=============================================================="
}

# Check Dependencies
check_deps() {
echo "[*] Checking and installing dependencies..."
for pkg in python git tsu termux-api curl wget nmap; do
  command -v $pkg >/dev/null 2>&1 || {
    echo "[+] Installing $pkg..."
    pkg install -y $pkg
  }
done
echo "[+] Dependencies ready."
}

# Launch Black-Hive Botnet
launch_black_hive() {
echo "[+] Launching Black-Hive Bot Network..."
cd modules/black-hive || { echo "Module not found!"; return; }
bash run.sh
}

# Launch Deauth Toolkit
launch_deauth() {
echo "[+] Deploying Deauth Toolkit..."
cd modules/deauth || { echo "Module not found!"; return; }
bash deauth.sh
}

# Launch Black Phantom AI
launch_phantom() {
echo "[+] Activating Black Phantom AI..."
cd modules/phantom || { echo "Module not found!"; return; }
python3 phantom.py
}

# Update Modules
update_modules() {
echo "[+] Updating all modules..."
git pull origin main
}

# Main Menu
main_menu() {
while true; do
banner
echo -e "\nSelect a Payload:"
echo "[1] Black-Hive Bot Network"
echo "[2] Deauth Toolkit"
echo "[3] Black Phantom AI"
echo "[4] Update Modules"
echo "[5] Exit"
read -p ">> " opt

case $opt in
  1) launch_black_hive ;;
  2) launch_deauth ;;
  3) launch_phantom ;;
  4) update_modules ;;
  5) echo "Exiting PlagueNet. Stay invisible..."; exit 0 ;;
  *) echo "Invalid option. Try again." ;;
esac
read -p "Press Enter to return to menu..."
done
}

# Run it all
check_deps
main_menu