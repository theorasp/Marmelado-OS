#!/bin/bash

# Farben für die Ausgabe
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

# 1. Root-Check
if [[ $EUID -ne 0 ]]; then
   echo -e "${RED}Fehler: Dieses Skript muss mit sudo ausgeführt werden!${NC}"
   exit 1
fi

# 2. Abhängigkeiten prüfen (grub wird für UEFI-Build benötigt)
if ! command -v mkarchiso &> /dev/null || ! command -v grub-install &> /dev/null; then
    echo -e "${RED}Fehler: archiso und grub müssen installiert sein!${NC}"
    echo "Nutze: sudo pacman -S archiso grub"
    exit 1
fi

# 3. Aufräumen (Work-Verzeichnis löschen, falls vorhanden)
echo -e "${GREEN}Bereinige alte Build-Reste...${NC}"
[ -d "work" ] && rm -rf work/
mkdir -p out

# 4. Der Build-Befehl
echo -e "${GREEN}Starte Build von Marmelado-OS...${NC}"
# Wir bauen im aktuellen Verzeichnis (.)
mkarchiso -v -w work/ -o out/ .

# 5. Abschluss
if [ $? -eq 0 ]; then
    echo -e "${GREEN}Build erfolgreich! Die ISO liegt im Ordner 'out/'.${NC}"
else
    echo -e "${RED}Build fehlgeschlagen. Überprüfe die Log-Ausgabe oben.${NC}"
    exit 1
fi
