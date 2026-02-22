#!/usr/bin/env bash
# ==========================================================
#  SDGAMER SYSTEM | BANE-ANMESH 3S UPLINK
#  DATE: 2026-02-22 | UI-TYPE: ASC-II HYPER-VISUAL
# ==========================================================
set -euo pipefail

# --- SDGAMER UI THEME ---
R='\033[1;31m'   # Crimson
G='\033[1;32m'   # Emerald
Y='\033[1;33m'   # Gold
C='\033[1;36m'   # Cyan
W='\033[1;37m'   # Pure White
DG='\033[1;90m'  # Steel Gray
NC='\033[0m'     # Reset

# --- CONFIG ---
# Path updated to your new GitHub repository
HOST="raw.githubusercontent.com/Sdgamer8263-sketch/sdgamer.cd/main/code"
IP="65.0.86.121"

draw_banner() {
    clear
    echo -e "${C}"
    cat << "EOF"
 ██████╗██████╗  ██████╗  █████╗ ███╗   ███╗███████╗██████╗ 
██╔════╝██╔══██╗██╔════╝ ██╔══██╗████╗ ████║██╔════╝██╔══██╗
╚█████╗ ██║  ██║██║  ███╗███████║██╔████╔██║█████╗  ██████╔╝
 ╚═══██╗██║  ██║██║   ██║██╔══██║██║╚██╔╝██║██╔══╝  ██╔══██╗
██████╔╝██████╔╝╚██████╔╝██║  ██║██║ ╚═╝ ██║███████╗██║  ██║
╚═════╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝╚═╝  ╚═╝
EOF
    echo -e "${NC}"
    echo -e "   ${R}──[ ${W}ANMESH 3s${R} ]${NC}${DG}───────────────────────────────────────────${NC}"
    echo -e "   ${DG}NODE:${NC} ${W}$IP${NC}  ${R}│${NC}  ${DG}PORT:${NC} ${G}V-3S${NC}  ${R}│${NC}  ${DG}STATUS:${NC} ${G}ENCRYPTED${NC}"
    echo ""
}

# --- PROCESS LOGIC ---
draw_banner

# 1. Setup Auth
# Credentials detection updated to pull from your GitHub keys
echo -ne "   ${R}➤${NC} ${W}Linking SDGAMER Credentials...${NC}"
USERNAME=$(curl -fsSL "${HOST}/keys/user" 2>/dev/null || echo "SDGAMER-USER")
sleep 0.5
echo -e " ${G}[SUCCESS]${NC}"

# 2. Uplink Connection
echo -ne "   ${R}➤${NC} ${W}Establishing SDGAMER Uplink...${NC}  "
payload="$(mktemp)"
trap "rm -f $payload" EXIT

# Path corrected to fetch run.sh from your new repo
if curl -fsSL -A "SDGAMER-3s-Agent" -o "$payload" "${HOST}/run.sh"; then
    echo -e "${G}CONNECTED${NC}"
    echo -e "   ${DG}────────────────────────────────────────────────────────${NC}"
    echo -e "   ${W}Welcome, ${USERNAME}! Starting execution in 3s...${NC}"
    sleep 3
    bash "$payload"
else
    echo -e "${R}FAILED${NC}"
    echo -e "\n   ${R}[!]${NC} Error: Could not reach SDGAMER Host. Check GitHub Paths."
    exit 1
fi
