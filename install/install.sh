#!/usr/bin/env bash
set -Eeuo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
INSTALL_DIR="$HOME/.config/quickshell/celona"
SRC_SHADERS_DIR="$INSTALL_DIR/shaders"
DST_SHADERS_DIR="$SRC_SHADERS_DIR/qsb"
NAMES=("parallax.vert" "parallax.frag")
source "$ROOT_DIR/pkg.sh"

BLUE="\033[34m"
RESET="\033[0m"

compile_shaders() {
    info "Compiling shaders..."
    mkdir -p "$DST_SHADERS_DIR"

    for shader in "${NAMES[@]}"; do
        qsb --qt6 \
            -o "$DST_SHADERS_DIR/$shader.qsb" \
            "$SRC_SHADERS_DIR/$shader"
    done

    ok "Shader compilation done"
}

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

info "Installing Celona config"
mkdir -p "$INSTALL_DIR"
cp -r "$ROOT_DIR/../quickshell/celona/"* "$INSTALL_DIR"
 
compile_shaders

ok "Finished!"
info "Check ~/.config/quickshell/nucleus-shell/* exists to confirm installation."
