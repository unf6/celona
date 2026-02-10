#!/usr/bin/env bash
set -Eeuo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

BLUE="\033[34m"
RESET="\033[0m"

clear
echo -e "${BLUE}"
cat <<'EOF'
   ______           __                              
  / ____/  ___     / /  ____     ____     ____ _    
 / /      / _ \   / /  / __ \   / __ \   / __ `/    
/ /___   /  __/  / /  / /_/ /  / / / /  / /_/ /     
\____/   \___/  /_/   \____/  /_/ /_/   \__,_/      
                                                    
EOF

echo -e "${RESET}"

bash "$ROOT_DIR/pkg.sh"

mkdir -p ~/.config/quickshell/celona
cp -r ../quickshell/celona/* ~/.config/quickshell/celona

echo "Finished!"
echo "Check ~/.config/quickshell/nucleus-shell/* exists to confirm installation."
