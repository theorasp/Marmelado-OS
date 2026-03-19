# 🍓 Marmelado OS

> **Dein datenschutzorientiertes, schnelles Linux** — basierend auf Arch Linux mit XFCE-Desktop.  
> Sicher. Schnell. Einfach. Kein Bloatware. Keine Überwachung.

```
  __  __                          _                 _        ___  ____
 |  \/  | __ _ _ __ _ __ ___  ___| | __ _  __| | ___  / _ \/ ___|
 | |\/| |/ _` | '__| '_ ` _ \/ _ \ |/ _` |/ _` |/ _ \| | | \___ \
 | |  | | (_| | |  | | | | | |  __/ | (_| | (_| | (_) | |_| |___) |
 |_|  |_|\__,_|_|  |_| |_| |_|\___|_|\__,_|\__,_|\___/ \___/|____/
```

---

## 📋 Inhaltsverzeichnis

1. [Was ist Marmelado OS?](#-was-ist-marmelado-os)
2. [Vorinstallierte Software](#-vorinstallierte-software)
3. [Privacy Features](#-privacy-features)
4. [Marmelado OS ISO bauen und installieren](#-marmelado-os-iso-bauen-und-installieren)
5. [Arch Linux manuell installieren](#-arch-linux-manuell-installieren-fortgeschrittene)
6. [Nach der Installation](#-nach-der-installation)
7. [Häufige Fragen](#-häufige-fragen)
8. [Repository-Struktur](#-repository-struktur)
9. [Mithelfen](#-mithelfen)

---

## 🌟 Was ist Marmelado OS?

Marmelado OS ist eine Linux-Distribution basierend auf **Arch Linux**. Das Ziel: ein System das sofort einsatzbereit ist, respektvoll mit deinen Daten umgeht und schnell läuft — ohne dass du stundenlang konfigurieren musst.

**Warum Arch Linux als Basis?**
- Rolling Release: du bekommst immer die neueste Software, kein "Upgrade auf Version X"
- Minimalistisch: nur das drauf was wirklich gebraucht wird
- Riesige Community und AUR (Arch User Repository) mit fast jeder App die es gibt

**Warum XFCE als Desktop?**
- Leichtgewichtig: startet schnell, braucht wenig RAM
- Übersichtlich: sieht aus wie Windows/Mint, alles intuitiv
- Anpassbar: Farben, Symbole, Layout — alles veränderbar

---

## 📦 Vorinstallierte Software

| Kategorie | Software | Beschreibung |
|---|---|---|
| 🌐 Browser | Chromium | Schnell, open-source, privacy-konfiguriert |
| 📄 Office | LibreOffice Fresh | Word, Excel, PowerPoint — alles dabei |
| 💻 Terminal | XFCE4 Terminal | Modernes Terminal mit Tabs |
| 📁 Dateien | Thunar | Übersichtlicher Dateimanager |
| 📋 Task-Manager | XFCE4 Task Manager | CPU/RAM Auslastung auf einen Blick |
| 🛒 App-Store | Pamac | Grafischer Paket-Manager |
| 📝 Texteditor | Mousepad | Einfacher Editor für Textdateien |
| 🖼 Bilder | Ristretto | Schneller Bildbetrachter |
| 🔵 Bluetooth | Blueman | Bluetooth-Geräte verbinden und verwalten |
| 🔥 Firewall | UFW + GUFW | Firewall mit grafischer Oberfläche |
| 📶 WLAN | NetworkManager | WLAN-Verbindung mit einem Klick |
| 🖨 Drucker | CUPS | Druckerverwaltung |

**Wichtige Tastenkürzel:**
| Kürzel | Aktion |
|---|---|
| `Windows-Taste` | App-Menü öffnen (wie bei Linux Mint) |
| `Strg + Alt + T` | Terminal öffnen |
| `Druck-Taste` | Screenshot machen |
| `Super + E` | Dateimanager öffnen |
| `Strg + Alt + L` | Bildschirm sperren |

---

## 🔒 Privacy Features

Marmelado OS schützt deine Privatsphäre von Anfang an — ohne dass du etwas einstellen musst.

**Firewall (UFW) — standardmäßig aktiv**
Alle eingehenden Verbindungen werden blockiert. Kein Fremdzugriff auf deinen PC möglich.

**DNS: Quad9 (9.9.9.9)**
Statt dem DNS deines Providers wird Quad9 genutzt — protokolliert nichts, blockiert Malware-Domains, sitzt in Europa (DSGVO-konform).

**MAC-Adress-Randomisierung**
Bei jeder WLAN-Verbindung wird eine andere MAC-Adresse genutzt. Verhindert Tracking in öffentlichen Netzwerken und Cafés.

**Chromium mit Privacy-Flags**
Kein Google-Sync, kein Telemetry, kein „Erststart"-Assistent, keine Hintergrundnetzwerkkommunikation.

**Kein Telemetry**
Marmelado OS sendet null Daten. Kein Phoning Home, keine Crash-Reports, keine Nutzungsstatistiken.

---

## 🚀 Marmelado OS ISO bauen und installieren

### Was du brauchst

- PC oder Laptop mit **64-Bit-Prozessor** (fast jeder PC seit 2010)
- Mindestens **2 GB RAM** (empfohlen: 4 GB oder mehr)
- Mindestens **20 GB** freier Speicherplatz auf der Festplatte
- Einen **USB-Stick** mit mindestens 4 GB
- Einen **Arch-Linux-Rechner** oder eine Arch-VM zum ISO-Bauen

---

### Teil 1 — ISO bauen

**Schritt 1 — Repository klonen:**
```bash
git clone https://github.com/yourusername/marmelado-os.git
cd marmelado-os
```

**Schritt 2 — archiso installieren:**
```bash
sudo pacman -S archiso
```

**Schritt 3 — ISO bauen:**
```bash
sudo ./scripts/build.sh
```
Das fertige ISO liegt danach in: `output/marmelado-os-x86_64.iso`
Dauer: ca. 10–30 Minuten je nach Internetgeschwindigkeit.

---

### Teil 2 — ISO auf USB-Stick schreiben

**Unter Linux (Terminal):**
```bash
# Zuerst den richtigen Gerätepfad des USB-Sticks herausfinden:
lsblk
# Ausgabe lesen: z.B. sdb = USB-Stick, sda = interne Festplatte

# ISO schreiben (sdX durch deinen USB-Stick ersetzen!):
sudo dd if=output/marmelado-os-x86_64.iso of=/dev/sdX bs=4M status=progress oflag=sync
```

> ⚠️ **Achtung:** `dd` überschreibt alles auf dem USB-Stick ohne Warnung. Den richtigen Pfad doppelt prüfen!

**Unter Windows:**
1. [Balena Etcher](https://etcher.balena.io/) herunterladen und installieren
2. Etcher öffnen → "Flash from file" → ISO auswählen
3. USB-Stick auswählen
4. "Flash!" klicken

**Unter macOS:**
```bash
diskutil list                         # USB-Stick Pfad finden (z.B. /dev/disk2)
diskutil unmountDisk /dev/diskX       # Stick aushängen
sudo dd if=marmelado-os.iso of=/dev/rdiskX bs=4m
```

---

### Teil 3 — Vom USB booten

1. USB-Stick in den PC einstecken
2. PC **neustarten**
3. Beim Start eine dieser Tasten drücken um ins BIOS/UEFI zu kommen:
   - **F2** — Asus, Acer, Dell
   - **F10** oder **F12** — HP, Lenovo
   - **Entf/Delete** — MSI, Gigabyte
   - **Esc** — viele andere
4. Im BIOS die **Boot-Reihenfolge** ändern: USB-Stick als erstes
5. Mit **F10** speichern und neustarten

Du siehst jetzt das Marmelado OS Live-System.

---

### Teil 4 — Marmelado OS installieren

Im Live-System gibt es zwei Wege:

**Weg A — Grafisch (einfach):**
Das Icon **"Marmelado OS installieren"** auf dem Desktop doppelklicken.

**Weg B — Terminal:**
```bash
sudo marmelado-install
```

Der Installer fragt dich der Reihe nach:
1. Auf welche Festplatte installiert werden soll
2. Deinen Benutzernamen und Passwort
3. Den PC-Namen (Hostname)
4. Deine Zeitzone

Danach läuft alles automatisch. Am Ende einfach den USB-Stick abziehen und neustarten.

---

### In VirtualBox testen (ohne echte Installation)

Perfekt zum Ausprobieren ohne Risiko:

1. [VirtualBox](https://www.virtualbox.org/wiki/Downloads) herunterladen und installieren
2. VirtualBox öffnen → **"Neu"** klicken
3. Einstellungen:
   - Name: `Marmelado OS`
   - Typ: `Linux`
   - Version: `Arch Linux (64-bit)`
4. RAM: mindestens **2048 MB** (besser: 4096 MB)
5. Festplatte: **Dynamisch alloziert**, mindestens 20 GB
6. VM erstellen → dann unter **Massenspeicher** das ISO als optisches Laufwerk einbinden
7. VM starten → Installer ausführen

---

## 🐧 Arch Linux manuell installieren (Fortgeschrittene)

> Diese Anleitung erklärt Schritt für Schritt wie man **Arch Linux von Grund auf** installiert — also genau das was der Marmelado-Installer automatisch macht. Ideal wenn du verstehen willst was im Hintergrund passiert, oder Arch ohne Marmelado installieren möchtest.

### Was du brauchst

- PC oder Laptop mit 64-Bit-Prozessor
- Mindestens 2 GB RAM (empfohlen: 4 GB)
- Mindestens 20 GB freier Speicherplatz
- USB-Stick mit mindestens 2 GB
- Internetverbindung (Kabel empfohlen für die Installation)

---

### Schritt 1 — Arch Linux ISO herunterladen und auf USB schreiben

Gehe zu [archlinux.org/download](https://archlinux.org/download/) und lade das aktuelle ISO herunter. Auf USB schreiben wie oben beschrieben, dann neu starten.

Du landest in einer **schwarzen Kommandozeile** — das ist normal und beabsichtigt! Arch Linux installiert man komplett im Terminal.

---

### Schritt 2 — Deutsches Tastaturlayout laden

Die US-Belegung ist voreingestellt. Für deutsche Tastaturen:
```bash
loadkeys de-latin1
```

---

### Schritt 3 — Internetverbindung herstellen

**Kabelverbindung:** Funktioniert automatisch. Testen:
```bash
ping -c 3 archlinux.org
```

**WLAN-Verbindung** mit `iwctl`:
```bash
iwctl
```

Du bist jetzt in der iwctl-Shell. Folgende Befehle eingeben:
```
device list
# Zeigt deine WLAN-Karte, meistens "wlan0"

station wlan0 scan
# Sucht nach Netzwerken (keine Ausgabe = normal)

station wlan0 get-networks
# Zeigt alle gefundenen Netzwerke

station wlan0 connect "Name-deines-WLANs"
# Passwort eingeben wenn gefragt

exit
# iwctl verlassen

ping -c 3 archlinux.org
# Verbindung testen
```

---

### Schritt 4 — Systemzeit synchronisieren

```bash
timedatectl set-ntp true
timedatectl status
# "synchronized: yes" sollte erscheinen
```

---

### Schritt 5 — Festplatten anzeigen

```bash
lsblk
```

Typische Ausgabe:
```
NAME   SIZE TYPE MOUNTPOINT
sda    500G disk
├─sda1   2G part   (eventuell USB-Stick)
sdb    256G disk   (interne Festplatte)
```

Wichtig: Die **interne Festplatte** identifizieren, nicht den USB-Stick!

---

### Schritt 6 — Herausfinden ob UEFI oder BIOS

```bash
ls /sys/firmware/efi/efivars
```

- **Dateien werden angezeigt** → dein System nutzt **UEFI** (modern, seit ca. 2012)
- **Fehlermeldung "No such file or directory"** → dein System nutzt **BIOS/Legacy** (ältere PCs)

---

### Schritt 7 — Festplatte partitionieren

> ⚠️ **Achtung:** Die Festplatte wird komplett gelöscht. Alle vorhandenen Daten gehen verloren!

Partitionierungswerkzeug starten (sda durch deine Festplatte ersetzen):
```bash
fdisk /dev/sda
```

#### Für UEFI-Systeme (empfohlen für moderne PCs):

Befehle im fdisk-Menü eingeben und mit Enter bestätigen:
```
g       ← neue GPT-Partitionstabelle erstellen (löscht alles!)
n       ← neue Partition erstellen
Enter   ← Partitionsnummer 1 (Standard)
Enter   ← erster Sektor (Standard)
+512M   ← 512 Megabyte für die EFI-Boot-Partition
t       ← Partitionstyp ändern
1       ← EFI System (Typ-Nummer 1)
n       ← zweite Partition erstellen
Enter   ← Partitionsnummer 2 (Standard)
Enter   ← erster Sektor (Standard)
Enter   ← letzter Sektor = gesamter restlicher Platz
w       ← alles speichern und fdisk beenden
```

Partitionen formatieren:
```bash
mkfs.fat -F32 -n EFI /dev/sda1     # EFI-Partition als FAT32
mkfs.ext4 -L ROOT /dev/sda2        # Haupt-Partition als ext4
```

Partitionen einhängen:
```bash
mount /dev/sda2 /mnt
mkdir -p /mnt/boot/efi
mount /dev/sda1 /mnt/boot/efi
```

#### Für BIOS/Legacy-Systeme (ältere PCs):

```
o       ← neue MBR-Partitionstabelle
n       ← neue Partition
p       ← primäre Partition
Enter   ← Nummer 1
Enter   ← erster Sektor
Enter   ← gesamte Festplatte nutzen
a       ← bootfähig markieren
w       ← speichern und beenden
```

```bash
mkfs.ext4 -L ROOT /dev/sda1
mount /dev/sda1 /mnt
```

---

### Schritt 8 — Basissystem installieren

```bash
pacstrap /mnt base base-devel linux linux-firmware linux-headers sudo nano
```

Dies installiert das minimale Arch-Linux-Grundsystem. Dauert 5–15 Minuten.

---

### Schritt 9 — fstab generieren

Die fstab-Datei sagt dem System welche Festplatten beim Start eingehängt werden sollen:
```bash
genfstab -U /mnt >> /mnt/etc/fstab

# Zur Kontrolle anzeigen:
cat /mnt/etc/fstab
# Beide Partitionen sollten hier stehen
```

---

### Schritt 10 — In das neue System wechseln (chroot)

```bash
arch-chroot /mnt
```

Ab jetzt arbeitest du direkt im frisch installierten System (auch wenn noch kein Desktop läuft).

---

### Schritt 11 — Zeitzone einstellen

```bash
ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime
hwclock --systohc
```

Andere Zeitzonen: `Europe/Vienna` (Österreich), `Europe/Zurich` (Schweiz).
Alle verfügbaren: `ls /usr/share/zoneinfo/Europe/`

---

### Schritt 12 — Sprache konfigurieren

```bash
nano /etc/locale.gen
```

In dieser Datei die Zeile `#de_DE.UTF-8 UTF-8` suchen und das `#` am Anfang löschen.
Speichern: `Strg+O` → Enter → `Strg+X`

```bash
locale-gen
echo "LANG=de_DE.UTF-8" > /etc/locale.conf
echo "LC_TIME=de_DE.UTF-8" >> /etc/locale.conf
```

---

### Schritt 13 — Tastatur im Terminal dauerhaft auf Deutsch setzen

```bash
echo "KEYMAP=de-latin1" > /etc/vconsole.conf
```

---

### Schritt 14 — Hostname (PC-Name) festlegen

```bash
echo "marmelado-pc" > /etc/hostname
# "marmelado-pc" durch deinen Wunschnamen ersetzen
```

Hosts-Datei anpassen:
```bash
nano /etc/hosts
```

Folgenden Inhalt einfügen (Hostnamen anpassen):
```
127.0.0.1   localhost
::1         localhost
127.0.1.1   marmelado-pc.localdomain marmelado-pc
```

---

### Schritt 15 — Root-Passwort setzen

```bash
passwd
# Passwort eingeben (erscheint nicht beim Tippen — das ist normal)
# Nochmal zur Bestätigung eingeben
```

---

### Schritt 16 — Eigenen Benutzer anlegen

```bash
# "felix" durch deinen gewünschten Benutzernamen ersetzen
useradd -m -G wheel,audio,video,storage,optical,network,power -s /bin/bash felix
passwd felix
```

Sudo-Rechte vergeben (damit der Benutzer `sudo` nutzen kann):
```bash
EDITOR=nano visudo
```

Suche die Zeile `# %wheel ALL=(ALL:ALL) ALL` und entferne das `#` davor:
```
%wheel ALL=(ALL:ALL) ALL
```
Speichern: `Strg+O` → Enter → `Strg+X`

---

### Schritt 17 — Netzwerk aktivieren

```bash
pacman -S networkmanager
systemctl enable NetworkManager
```

---

### Schritt 18 — Bootloader (GRUB) installieren

**Für UEFI:**
```bash
pacman -S grub efibootmgr os-prober
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB
```

**Für BIOS/Legacy:**
```bash
pacman -S grub os-prober
grub-install --target=i386-pc /dev/sda
```

GRUB-Konfiguration erstellen:
```bash
grub-mkconfig -o /boot/grub/grub.cfg
```

---

### Schritt 19 — initramfs erstellen

```bash
mkinitcpio -P
```

---

### Schritt 20 — Desktop (XFCE) und alle Apps installieren

```bash
pacman -S xorg xfce4 xfce4-goodies \
    lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings \
    xfce4-whiskermenu-plugin xfce4-pulseaudio-plugin xfce4-battery-plugin \
    thunar gvfs gvfs-mtp tumbler \
    networkmanager network-manager-applet nm-connection-editor \
    chromium libreoffice-fresh \
    xfce4-terminal xfce4-taskmanager mousepad ristretto \
    bluez bluez-utils blueman \
    cups system-config-printer avahi nss-mdns \
    ufw gufw firejail bleachbit \
    pipewire pipewire-alsa pipewire-pulse wireplumber pavucontrol \
    ttf-liberation ttf-dejavu noto-fonts noto-fonts-emoji \
    git wget curl htop neofetch zip unzip p7zip bash-completion \
    polkit-gnome xdg-user-dirs xdg-utils gparted man-db
```

Alle wichtigen Dienste aktivieren:
```bash
systemctl enable lightdm        # grafischer Login
systemctl enable NetworkManager # Netzwerk
systemctl enable bluetooth      # Bluetooth
systemctl enable cups           # Drucker
systemctl enable avahi-daemon   # Netzwerkerkennung
systemctl enable ufw            # Firewall
```

---

### Schritt 21 — Firewall einrichten

```bash
ufw default deny incoming
ufw default allow outgoing
ufw enable
```

---

### Schritt 22 — chroot beenden und neustarten

```bash
exit              # chroot verlassen → zurück ins Live-System
umount -R /mnt    # Partitionen sauber aushängen
reboot            # neustarten
```

**Vor dem Neustart den USB-Stick abziehen!**

---

### Schritt 23 — Erster Start und Einrichtung

Nach dem Neustart siehst du den **LightDM Login-Screen**. Mit deinem Benutzernamen und Passwort einloggen.

Jetzt noch das Marmelado-Post-Install-Skript ausführen für alle Privacy-Einstellungen:
```bash
# Terminal öffnen (Strg+Alt+T)
git clone https://github.com/yourusername/marmelado-os.git
cd marmelado-os
bash scripts/post-install.sh
```

---

## 🔧 Nach der Installation

### Apps installieren

**Grafisch:** Pamac öffnen (App-Store) → suchen → installieren.

**Im Terminal:**
```bash
sudo pacman -S paketname     # offizielle Pakete (Arch-Repos)
yay -S paketname             # AUR-Pakete (fast alles was es gibt)
```

Beliebte Apps zum Nachinstallieren:
```bash
sudo pacman -S vlc           # Video-Player
sudo pacman -S gimp          # Bildbearbeitung (wie Photoshop)
sudo pacman -S inkscape      # Vektorgrafik
yay -S spotify               # Spotify
yay -S discord               # Discord
yay -S visual-studio-code-bin  # VS Code
yay -S telegram-desktop      # Telegram
yay -S obs-studio            # OBS für Streaming
```

### System aktualisieren

```bash
sudo pacman -Syu             # System und alle Pakete aktualisieren
yay -Syu                     # inkl. AUR-Pakete
```

> Empfehlung: Einmal pro Woche aktualisieren.

### WLAN verbinden

Klick auf das **WLAN-Symbol** rechts unten in der Taskleiste → Netzwerk auswählen → Passwort eingeben.

Alternativ im Terminal: `nmtui` (grafische TUI-Oberfläche).

### Neuen Benutzer anlegen

```bash
sudo useradd -m -G wheel,audio,video,storage -s /bin/bash neuernutzer
sudo passwd neuernutzer
```

### Desktop anpassen

- **Rechtsklick auf leeren Desktop** → Hintergrund ändern, Desktop-Einstellungen
- **Rechtsklick auf Taskleiste** → Panel-Einstellungen → Plugins hinzufügen/entfernen
- Apps auf die Taskleiste ziehen um sie anzupinnen
- Apps auf den Desktop ziehen für Desktop-Verknüpfungen

---

## ❓ Häufige Fragen

**Funktioniert meine Hardware?**
Intel- und AMD-Grafik sowie die meisten WiFi-Karten funktionieren out-of-the-box. NVIDIA-Grafikkarten brauchen einen extra Treiber:
```bash
sudo pacman -S nvidia nvidia-utils nvidia-settings
sudo reboot
```

**Dual-Boot mit Windows — geht das?**
Ja! Der GRUB-Bootloader erkennt Windows automatisch. Sicherstellen dass in `/etc/default/grub` steht:
```
GRUB_DISABLE_OS_PROBER=false
```
Dann `sudo grub-mkconfig -o /boot/grub/grub.cfg` ausführen.

**Ich sehe nach dem Neustart nur eine schwarze Konsole, kein Desktop!**
```bash
sudo systemctl start lightdm       # Desktop manuell starten
sudo systemctl enable lightdm      # dauerhaft aktivieren
```

**Was ist der Unterschied zwischen `pacman` und `yay`?**
`pacman` installiert Pakete aus den offiziellen Arch-Repos. `yay` macht das gleiche, kann aber zusätzlich Pakete aus dem AUR (Arch User Repository) installieren — das ist eine Community-Sammlung mit tausenden weiterer Apps.

**Wie finde ich heraus welches Paket eine Datei enthält?**
```bash
pacman -F /usr/bin/programmname
```

**Mein WLAN-Adapter wird nicht erkannt!**
```bash
ip link                   # zeigt alle Netzwerkinterfaces
sudo dmesg | grep wifi    # Fehlermeldungen anzeigen
sudo pacman -S linux-firmware   # Firmware-Pakete aktualisieren
```

**Wie entferne ich ein Programm vollständig?**
```bash
sudo pacman -Rns paketname    # Paket + ungenutzte Abhängigkeiten entfernen
```

**Arch ist zu kompliziert für mich — was tun?**
Nutze einfach den Marmelado OS Installer (`sudo marmelado-install`) — der erledigt alles automatisch!

---

## 📁 Repository-Struktur

```
marmelado-os/
├── README.md                               ← Diese Datei
├── LICENSE                                 ← GPL-3.0
├── .gitignore
│
├── .github/
│   └── workflows/
│       └── validate.yml                    ← GitHub Actions: automatische Prüfung
│
├── scripts/
│   ├── build.sh                            ← ISO bauen (auf Arch Linux ausführen)
│   ├── post-install.sh                     ← Nach der Installation ausführen
│   ├── profiledef.sh                       ← archiso-Profil Definition
│   └── packages.x86_64                    ← Liste aller vorinstallierten Pakete
│
├── airootfs/                               ← Dateien die ins Live-ISO kopiert werden
│   ├── etc/
│   │   ├── NetworkManager/
│   │   │   ├── mac-randomize.conf          ← MAC-Adress-Randomisierung
│   │   │   └── dns-quad9.conf             ← Quad9 Privacy-DNS
│   │   ├── ufw/
│   │   │   └── ufw.conf                   ← Firewall-Standardeinstellungen
│   │   └── skel/                          ← Wird für jeden neuen Nutzer kopiert
│   │       ├── .bashrc                    ← Terminal-Einstellungen und Aliases
│   │       └── .config/
│   │           ├── autostart/
│   │           │   └── marmelado-welcome.desktop ← Willkommens-App beim Start
│   │           └── xfce4/panel/
│   │               └── whiskermenu-1.rc   ← App-Menü Konfiguration
│   └── usr/
│       ├── bin/
│       │   ├── marmelado-install           ← Interaktiver Installer
│       │   └── marmelado-welcome           ← Willkommens-Dialog
│       └── share/
│           └── applications/
│               └── marmelado-install.desktop ← Desktop-Icon für Installer
│
├── configs/
│   ├── xfce/
│   │   ├── xfce4-panel.xml                ← Taskleiste (Uhr, Akku, WLAN, etc.)
│   │   ├── xfce4-desktop.xml              ← Desktop + Helldivers-Wallpaper
│   │   └── xfce4-keyboard-shortcuts.xml  ← Windows-Taste → App-Menü
│   ├── grub/
│   │   ├── theme.txt                      ← GRUB-Bootloader Theme
│   │   └── grub                           ← GRUB Konfiguration
│   └── lightdm/
│       ├── lightdm.conf                   ← Login-Screen Einstellungen
│       └── lightdm-gtk-greeter.conf       ← Login-Screen Design
│
├── branding/
│   └── WALLPAPER.md                       ← Anleitung zum Wallpaper hinzufügen
│
└── docs/
    ├── INSTALL.md                          ← Kurzanleitung Installation
    ├── PRIVACY.md                          ← Datenschutz-Details
    └── CONTRIBUTING.md                    ← Wie man mitmachen kann
```

---

## 🤝 Mithelfen

Pull Requests sind herzlich willkommen! Schau in [docs/CONTRIBUTING.md](docs/CONTRIBUTING.md) für Details.

Bereiche wo Hilfe gebraucht wird:
- Weitere Wallpapers (müssen frei lizenziert sein, z.B. CC0)
- GRUB-Theme Design verbessern
- LUKS-Festplattenverschlüsselung im Installer ergänzen
- Dokumentation in weitere Sprachen übersetzen
- Tests auf verschiedener Hardware

---

## 📜 Lizenz

**GPL-3.0** — Frei und open source für immer. Details in [LICENSE](LICENSE).

---

*Marmelado OS — gemacht mit ❤️ und einer gesunden Portion Paranoia gegenüber Datenkraken.*
