#!/usr/bin/env bash
# =============================================================================
# Marmelado OS — archiso profiledef.sh
# =============================================================================

iso_name="marmelado-os"
iso_label="MARMELADO_$(date --date="@${SOURCE_DATE_EPOCH:-$(date +%s)}" +%Y%m)"
iso_publisher="Marmelado OS <https://github.com/yourusername/marmelado-os>"
iso_application="Marmelado OS Live/Rescue DVD"
iso_version="$(date --date="@${SOURCE_DATE_EPOCH:-$(date +%s)}" +%Y.%m.%d)"
install_dir="arch"
buildmodes=('iso')
bootmodes=('uefi-x64.grub.esp' 'uefi-x64.grub.eltorito')
arch="x86_64"
pacman_conf="pacman.conf"
airootfs_image_type="squashfs"
airootfs_image_tool_options=('-comp' 'xz' '-Xbcj' 'x86' '-b' '1M' '-Xdict-size' '1M')
file_permissions=(
    ["/etc/shadow"]="0:0:400"
    ["/etc/gshadow"]="0:0:400"
    ["/usr/bin/marmelado-welcome"]="0:0:755"
    ["/usr/bin/marmelado-install"]="0:0:755"
)
