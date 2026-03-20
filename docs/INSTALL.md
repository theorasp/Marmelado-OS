# Marmelado OS — Installationsanleitung

## Methode 1: ISO bauen und booten (empfohlen)

### Voraussetzungen
- Ein PC oder Laptop mit mindestens 2 GB RAM und 20 GB Festplatte
- Einen USB-Stick mit mindestens 4 GB
- Einen Arch-Linux-Rechner zum Bauen (oder eine Arch-VM)

### 1. ISO bauen

```bash
git clone https://github.com/theorasp/marmelado-os.git
cd marmelado-os
sudo pacman -S archiso
sudo ./scripts/build.sh
```

Das ISO liegt danach in `output/marmelado-os-x86_64.iso`.

### 2. ISO auf USB schreiben

**Linux (Terminal):**
```bash
# /dev/sdX durch deinen USB-Stick ersetzen!
sudo dd if=output/marmelado-os-x86_64.iso of=/dev/sdX bs=4M status=progress oflag=sync
```

**Windows / macOS:**
Nutze [Balena Etcher](https://etcher.balena.io/) oder [Ventoy](https://www.ventoy.net/).

### 3. Vom USB booten

- PC neustarten
- BIOS/UEFI aufrufen (meistens F2, F12, Entf oder Esc beim Start)
- USB-Stick als erste Boot-Option setzen
- Speichern und neustarten

### 4. Marmelado OS installieren

Im Live-System erscheint auf dem Desktop das Icon **"Marmelado OS installieren"** — einfach doppelklicken!

Oder im Terminal:
```bash
sudo marmelado-install
```

Der Installer fragt dich nach:
- Ziel-Festplatte
- Benutzername und Passwort
- Hostname (PC-Name)
- Zeitzone

---

## Methode 2: In einer virtuellen Maschine testen

Perfekt zum Ausprobieren ohne echte Installation.

### VirtualBox
1. Neue VM erstellen: **Linux / Arch Linux (64-bit)**
2. RAM: mindestens 2048 MB
3. Festplatte: mindestens 20 GB (dynamisch)
4. ISO als optisches Laufwerk einbinden
5. VM starten → Installer ausführen

### QEMU/KVM (für Fortgeschrittene)
```bash
qemu-system-x86_64 \
  -m 4G \
  -cpu host \
  -enable-kvm \
  -cdrom output/marmelado-os-x86_64.iso \
  -boot d
```

---

## Nach der Installation

### WLAN verbinden
- Klick auf das WLAN-Symbol in der Taskleiste (unten rechts)
- Netzwerk auswählen, Passwort eingeben — fertig!

Oder im Terminal mit `nmtui`.

### Apps installieren
- **Pamac** (App-Store) öffnen → Suchen → Installieren
- Terminal: `sudo pacman -S paketname`
- AUR-Pakete: `yay -S paketname`

### System aktualisieren
```bash
sudo pacman -Syu
```

---

## Häufige Fragen

**Dual-Boot mit Windows?**
Marmelado OS erkennt Windows automatisch beim Installieren und fügt es ins GRUB-Menü ein.

**Deutsch als Sprache einstellen?**
Beim Installer einfach `de_DE.UTF-8` als Locale wählen.

**Treiber für NVIDIA/AMD?**
Nach der Installation:
```bash
# NVIDIA (proprietär):
sudo pacman -S nvidia nvidia-utils

# AMD (open source, meist automatisch):
sudo pacman -S mesa vulkan-radeon
```
