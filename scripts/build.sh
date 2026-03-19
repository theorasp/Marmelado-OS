#!/usr/bin/env bash
# =============================================================================
# Marmelado OS — ISO Build Script
# Requires: archiso, root privileges, Arch Linux host
# =============================================================================

set -euo pipefail

SCRIPT_DIR="$(cd ""$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"
WORK_DIR="/tmp/marmelado-build"
OUT_DIR="$PROJECT_DIR/output"
PROFILE_DIR="$WORK_DIR/profile"

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

log()  { echo -e "${GREEN}[✓]${NC} $*"; }
warn() { echo -e "${YELLOW}[!]${NC} $*"; }
err()  { echo -e "${RED}[✗]${NC} $*"; exit 1; }
info() { echo -e "${BLUE}[→]${NC} $*"; }

banner() {
cat << 'EOF'
  __  __                          _                 _        ___  ____
 |  \/  | __ _ _ __ _ __ ___  ___| | __ _  __| | ___  / _ \/ ___|
 | |\/| |/ _` | '__| '_ ` _ \/ _ \ |/ _` |/ _` |/ _ \| | | \___ \
 | |  | | (_| | |  | | | | | |  __/ | (_| | (_| | (_) | |_| |___) |
 |_|  |_|\__,_|_|  |_| |_| |_|\___|_|\__,_|\__,_|\___/ \___/|____/

                     Building your privacy OS...
EOF
}

check_root() {
    [[ $EUID -eq 0 ]] || err "This script must be run as root. Use: sudo ./scripts/build.sh"
}

check_deps() {
    info "Checking dependencies..."
    local deps=(archiso git squashfs-tools libisoburn)
    for dep in "${deps[@]}"; do
        if ! pacman -Qi "$dep" &>/dev/null; then
            warn "$dep not installed. Installing..."
            pacman -S --noconfirm "$dep" || err "Failed to install $dep"
        fi
    done
    log "All dependencies satisfied."
}

setup_profile() {
    info "Setting up archiso profile..."
    rm -rf "$WORK_DIR"
    mkdir -p "$WORK_DIR" "$OUT_DIR"

    # Copy the base releng profile from archiso
    cp -r /usr/share/archiso/configs/releng/ "$PROFILE_DIR"

    # Overlay our custom airootfs on top
    cp -r "$PROJECT_DIR/airootfs/." "$PROFILE_DIR/airootfs/"

    # Copy our package list
    cp "$PROJECT_DIR/scripts/packages.x86_64" "$PROFILE_DIR/packages.x86_64"

    # Copy profiledef
    cp "$PROJECT_DIR/scripts/profiledef.sh" "$PROFILE_DIR/profiledef.sh"

    log "Profile ready at $PROFILE_DIR"
}

apply_configs() {
    info "Applying XFCE, GRUB, and LightDM configs..."

    # XFCE skel config (default for every new user)
    mkdir -p "$PROFILE_DIR/airootfs/etc/skel/.config/xfce4/xfconf/xfce-perchannel-xml"
    cp "$PROJECT_DIR/configs/xfce/"*.xml \
        "$PROFILE_DIR/airootfs/etc/skel/.config/xfce4/xfconf/xfce-perchannel-xml/" 2>/dev/null || true

    # GRUB theme
    mkdir -p "$PROFILE_DIR/airootfs/boot/grub/themes/marmelado"
    cp -r "$PROJECT_DIR/configs/grub/." \
        "$PROFILE_DIR/airootfs/boot/grub/themes/marmelado/" 2>/dev/null || true

    # LightDM
    cp "$PROJECT_DIR/configs/lightdm/lightdm.conf" \
        "$PROFILE_DIR/airootfs/etc/lightdm/lightdm.conf" 2>/dev/null || true
    cp "$PROJECT_DIR/configs/lightdm/lightdm-gtk-greeter.conf" \
        "$PROFILE_DIR/airootfs/etc/lightdm/lightdm-gtk-greeter.conf" 2>/dev/null || true

    log "Configs applied."
}

build_iso() {
    info "Building ISO (this will take 10–30 minutes)..."
    mkarchiso -v -w "$WORK_DIR/work" -o "$OUT_DIR/marmelado-os-x86_64.iso" "$PROFILE_DIR"
    log "ISO built successfully!"
    log "Output: $OUT_DIR/marmelado-os-x86_64.iso"
}

cleanup() {
    info "Cleaning up build files..."
    rm -rf "$WORK_DIR/work"
    log "Done."
}

main() {
    banner
    check_root
    check_deps
    setup_profile
    apply_configs
    build_iso
    cleanup

    echo ""
    echo -e "${GREEN}╔══════════════════════════════════════════════════╗${NC}"
    echo -e "${GREEN}║   Marmelado OS ISO build complete!               ║${NC}"
    echo -e "${GREEN}║   Flash with: sudo dd if=output/*.iso of=/dev/sdX bs=4M status=progress ║${NC}"
    echo -e "${GREEN}╚══════════════════════════════════════════════════╝${NC}"
}

main "$@"