#!/usr/bin/env bash
# =============================================================================
# Marmelado OS — Post-Install Script
# Run this after installing Marmelado OS to a disk
# Usage: bash post-install.sh
# =============================================================================

set -euo pipefail

RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'; BLUE='\033[0;34m'; NC='\033[0m'
log()  { echo -e "${GREEN}[✓]${NC} $*"; }
warn() { echo -e "${YELLOW}[!]${NC} $*"; }
info() { echo -e "${BLUE}[→]${NC} $*"; }

echo ""
echo -e "${RED}  🍓 Marmelado OS — Post-Install Setup${NC}"
echo "  ======================================="
echo ""

# --- Enable essential services ---
enable_services() {
    info "Enabling system services..."
    sudo systemctl enable --now NetworkManager
    sudo systemctl enable --now lightdm
    sudo systemctl enable --now bluetooth
    sudo systemctl enable --now cups
    sudo systemctl enable --now avahi-daemon
    sudo systemctl enable --now ufw
    log "Services enabled."
}

# --- Firewall setup ---
setup_firewall() {
    info "Configuring firewall..."
    sudo ufw default deny incoming
    sudo ufw default allow outgoing
    sudo ufw allow out 53          # DNS
    sudo ufw allow out 80          # HTTP
    sudo ufw allow out 443         # HTTPS
    sudo ufw allow out 123/udp     # NTP time sync
    sudo ufw enable
    log "Firewall configured. Default: deny incoming, allow outgoing."
}

# --- Privacy DNS (Quad9) ---
setup_dns() {
    info "Setting privacy DNS (Quad9)..."
    sudo mkdir -p /etc/NetworkManager/conf.d
    cat <<EOF | sudo tee /etc/NetworkManager/conf.d/dns-quad9.conf > /dev/null
[global-dns-domain-*]
servers=9.9.9.9,149.112.112.112
EOF
    sudo systemctl restart NetworkManager
    log "DNS set to Quad9 (9.9.9.9)."
}

# --- MAC Address Randomization ---
setup_mac_random() {
    info "Enabling MAC address randomization..."
    cat <<EOF | sudo tee /etc/NetworkManager/conf.d/mac-randomize.conf > /dev/null
[device]
wifi.scan-rand-mac-address=yes

[connection]
wifi.cloned-mac-address=random
ethernet.cloned-mac-address=random
EOF
    log "MAC randomization enabled."
}

# --- Default user directories ---
setup_dirs() {
    info "Creating default user directories..."
    xdg-user-dirs-update
    log "User directories created (Dokumente, Bilder, Downloads, etc.)."
}

# --- Chromium privacy flags ---
setup_chromium() {
    info "Configuring Chromium privacy settings..."
    mkdir -p ~/.config/chromium/
    cat <<EOF > ~/.config/chromium-flags.conf
--disable-sync
--no-default-browser-check
--disable-background-networking
--disable-client-side-phishing-detection
--disable-default-apps
--disable-hang-monitor
--disable-popup-blocking
--no-first-run
EOF
    log "Chromium configured with privacy flags."
}

# --- XFCE keyboard shortcut: Super key opens Whisker Menu ---
setup_keyboard_shortcuts() {
    info "Setting up keyboard shortcuts..."
    # Super (Windows) key opens Whisker Menu
    xfconf-query -c xfce4-keyboard-shortcuts \
        -p "/commands/custom/Super_L" \
        -s "xfce4-popup-whiskermenu" \
        --create -t string 2>/dev/null || true
    log "Super key → Whisker Menu shortcut set."
}

# --- AUR helper (yay) ---
install_yay() {
    if ! command -v yay &>/dev/null; then
        info "Installing yay (AUR helper)..."
        cd /tmp
        git clone https://aur.archlinux.org/yay.git
        cd yay
        makepkg -si --noconfirm
        cd ~
        rm -rf /tmp/yay
        log "yay installed."
    else
        log "yay already installed."
    fi
}

# --- Update system ---
update_system() {
    info "Updating system packages..."
    sudo pacman -Syu --noconfirm
    log "System up to date."
}

# --- Optional: Install pamac if missing ---
install_pamac() {
    if ! command -v pamac &>/dev/null; then
        info "Installing Pamac (App Store)..."
        yay -S --noconfirm pamac-gtk || warn "Could not install pamac. Try manually: yay -S pamac-gtk"
    else
        log "Pamac already installed."
    fi
}

# --- Neofetch config for Marmelado branding ---
setup_neofetch() {
    info "Configuring neofetch..."
    mkdir -p ~/.config/neofetch
    cat <<'EOF' > ~/.config/neofetch/config.conf
print_info() {
    info title
    info underline
    info "OS" distro
    info "Host" model
    info "Kernel" kernel
    info "Uptime" uptime
    info "Packages" packages
    info "Shell" shell
    info "Resolution" resolution
    info "DE" de
    info "WM" wm
    info "Terminal" term
    info "CPU" cpu
    info "GPU" gpu
    info "Memory" memory
    info cols
}
distro_shorthand="on"
os_arch="on"
memory_unit="mib"
EOF
    log "Neofetch configured."
}

# --- Summary ---
summary() {
    echo ""
    echo -e "${GREEN}╔═══════════════════════════════════════════╗${NC}"
    echo -e "${GREEN}║   🍓 Marmelado OS setup complete!         ║${NC}"
    echo -e "${GREEN}║                                           ║${NC}"
    echo -e "${GREEN}║   • Firewall: enabled (UFW)               ║${NC}"
    echo -e "${GREEN}║   • DNS: Quad9 (privacy)                  ║${NC}"
    echo -e "${GREEN}║   • MAC: randomization on                 ║${NC}"
    echo -e "${GREEN}║   • Super key: opens app menu             ║${NC}"
    echo -e "${GREEN}║   • Chromium: privacy flags set           ║${NC}"
    echo -e "${GREEN}║                                           ║${NC}"
    echo -e "${GREEN}║   Reboot recommended: sudo reboot         ║${NC}"
    echo -e "${GREEN}╚═══════════════════════════════════════════╝${NC}"
    echo ""
}

main() {
    enable_services
    setup_firewall
    setup_dns
    setup_mac_random
    setup_dirs
    setup_chromium
    setup_keyboard_shortcuts
    install_yay
    update_system
    install_pamac
    setup_neofetch
    summary
}

main "$@"
