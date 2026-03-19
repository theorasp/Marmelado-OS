# 🍓 Marmelado OS

> **Dein datenschutzorientiertes, schnelles Linux**
> Sicher. Schnell. Einfach. Kein Bloatware. Keine Überwachung.

```
  __  __                          _                 _        ___  ____
 |  \/  | __ _ _ __ _ __ ___  ___| | __ _  __| | ___  / _ \/ ___|
 | |\/| |/ _` | '__| '_ ` _ \/ _ \ |/ _` |/ _` |/ _ \| | | \___ \
 | |  | | (_| | |  | | | | | |  __/ | (_| | (_| | (_) | |_| |___) |
 |_|  |_|\__,_|_|  |_| |_| |_|\___|_|\__,_|\__,_|\___/ \___/|____/
```

[![Validate](https://github.com/theorasp/Marmelado-OS/actions/workflows/validate.yml/badge.svg)](https://github.com/theorasp/Marmelado-OS/actions/workflows/validate.yml)

---

## ⬇️ Jetzt installieren — 5 einfache Schritte

### Schritt 1 — ISO herunterladen

Klick hier zum Herunterladen:

**➡️ [Manjaro XFCE ISO herunterladen](https://manjaro.org/products/download/xfce)**

> Manjaro ist die Basis von Marmelado OS — Arch Linux, aber sofort einsatzbereit.

---

### Schritt 2 — Auf USB-Stick flashen

Wähle dein Betriebssystem:

#### 🪟 Windows
1. [Balena Etcher](https://etcher.balena.io/) herunterladen und installieren
2. Etcher öffnen
3. **"Flash from file"** → das ISO auswählen
4. **"Select target"** → USB-Stick auswählen
5. **"Flash!"** klicken → fertig!

#### 🍎 macOS
1. [Balena Etcher](https://etcher.balena.io/) herunterladen
2. Etcher öffnen → ISO auswählen → USB auswählen → Flash!

#### 🐧 Linux
```bash
# USB-Stick Pfad herausfinden:
lsblk
# Dann flashen (/dev/sdX durch deinen USB ersetzen!):
sudo dd if=manjaro-xfce-*.iso of=/dev/sdX bs=4M status=progress oflag=sync
```

---

### Schritt 3 — Vom USB booten

1. USB-Stick einstecken und PC **neustarten**
2. Beim Start diese Taste drücken:

| PC-Marke | Taste |
|---|---|
| Asus, Acer, Dell | F2 |
| HP, Lenovo | F10 oder F12 |
| MSI, Gigabyte | Entf/Delete |
| Andere | Esc |

3. **Boot-Reihenfolge** ändern: USB-Stick als erstes
4. **F10** speichern → neustarten

---

### Schritt 4 — Manjaro installieren

Im Live-System auf **"Launch Installer"** doppelklicken:
- Sprache: **Deutsch**
- Zeitzone: **Europe/Berlin**
- Tastatur: **German**
- Benutzername und Passwort festlegen
- Festplatte auswählen → **"Jetzt installieren"**
- Warten bis fertig → **Neustarten**

---

### Schritt 5 — Marmelado OS einrichten

Nach dem Neustart Terminal öffnen (`Strg+Alt+T`):

```bash
git clone https://github.com/theorasp/Marmelado-OS.git
cd Marmelado-OS
bash scripts/post-install.sh
```

Das Skript richtet automatisch alles ein:

| Feature | Was passiert |
|---|---|
| 🔥 Firewall | UFW wird aktiviert — alle eingehenden Verbindungen blockiert |
| 🌐 DNS | Quad9 (9.9.9.9) wird gesetzt — kein Tracking, blockiert Malware |
| 📶 MAC | Zufällige MAC-Adresse bei jeder WLAN-Verbindung |
| 🌍 Chromium | Privacy-Flags gesetzt, kein Google-Sync |
| ⌨️ Tastenkürzel | Windows-Taste öffnet App-Menü |
| 📁 Ordner | Dokumente, Bilder, Downloads werden angelegt |

**Neustarten — fertig! Willkommen bei Marmelado OS. 🍓**

---

## 📦 Vorinstallierte Software

| Kategorie | Software |
|---|---|
| 🌐 Browser | Chromium |
| 📄 Office | LibreOffice Fresh |
| 💻 Terminal | XFCE4 Terminal |
| 📁 Dateien | Thunar Dateimanager |
| 📋 Task-Manager | XFCE4 Task Manager |
| 🛒 App-Store | Pamac |
| 📝 Editor | Mousepad |
| 🖼 Bilder | Ristretto |
| 🔵 Bluetooth | Blueman |
| 🔥 Firewall | UFW + GUFW |
| 📶 WLAN | NetworkManager |
| 🖨 Drucker | CUPS |

**Tastenkürzel:**

| Kürzel | Aktion |
|---|---|
| `Windows-Taste` | App-Menü öffnen |
| `Strg + Alt + T` | Terminal öffnen |
| `Druck-Taste` | Screenshot |
| `Super + E` | Dateimanager |
| `Strg + Alt + L` | Bildschirm sperren |

---

## 🔒 Privacy Features

- **Firewall (UFW)** — alle eingehenden Verbindungen blockiert, kein Fremdzugriff
- **DNS Quad9 (9.9.9.9)** — kein Logging, blockiert Malware-Domains, DSGVO-konform
- **MAC-Randomisierung** — zufällige MAC-Adresse, kein Tracking in öffentlichen Netzwerken
- **Chromium Privacy-Flags** — kein Google-Sync, kein Telemetry, kein Background-Networking
- **Kein Telemetry** — Marmelado OS sendet null Daten

---

## ❓ Häufige Fragen

**Funktioniert meine Hardware?**
Intel und AMD funktionieren sofort. NVIDIA braucht nach der Installation:
```bash
sudo pacman -S nvidia nvidia-utils && sudo reboot
```

**Dual-Boot mit Windows?**
Ja! Windows wird automatisch erkannt. In `/etc/default/grub` setzen:
```
GRUB_DISABLE_OS_PROBER=false
```
Dann: `sudo grub-mkconfig -o /boot/grub/grub.cfg`

**Apps installieren?**
```bash
sudo pacman -S paketname        # offizielle Pakete
yay -S paketname                # AUR (fast alles)
# oder einfach Pamac (App-Store) öffnen
```

**System aktualisieren?**
```bash
sudo pacman -Syu
```

**Neuen Benutzer anlegen?**
```bash
sudo useradd -m -G wheel,audio,video -s /bin/bash name
sudo passwd name
```

---

## 📁 Repository-Struktur

```
marmelado-os/
├── README.md                          ← Diese Datei
├── LICENSE                            ← GPL-3.0
├── .github/workflows/
│   ├── validate.yml                   ← Automatische Code-Prüfung
│   └── build-iso.yml                  ← ISO-Build in der Cloud
├── scripts/
│   ├── post-install.sh                ← Marmelado einrichten (HIER STARTEN)
│   ├── build.sh                       ← ISO bauen (braucht Arch Linux)
│   ├── profiledef.sh                  ← archiso Profil
│   └── packages.x86_64               ← Paketliste
├── airootfs/                          ← Live-ISO Dateien
│   ├── etc/NetworkManager/            ← MAC-Randomisierung, DNS
│   ├── etc/ufw/                       ← Firewall
│   ├── etc/skel/                      ← Standard-Nutzerdateien
│   └── usr/bin/
│       ├── marmelado-install          ← Installer
│       └── marmelado-welcome          ← Willkommens-App
├── configs/
│   ├── xfce/                          ← Desktop, Panel, Tastenkürzel
│   ├── grub/                          ← Bootloader Theme
│   └── lightdm/                       ← Login-Screen
└── docs/
    ├── INSTALL.md
    ├── PRIVACY.md
    └── CONTRIBUTING.md
```

---

## 🤝 Mithelfen

Pull Requests willkommen! Schau in [docs/CONTRIBUTING.md](docs/CONTRIBUTING.md).

Hilfe gesucht bei:
- Wallpapers (frei lizenziert, CC0)
- GRUB-Theme Design
- LUKS-Festplattenverschlüsselung
- Übersetzungen
- Hardware-Tests

---

## 📜 Lizenz

**GPL-3.0** — Frei und open source für immer.

---

*Marmelado OS — gemacht mit ❤️ und einer gesunden Portion Paranoia gegenüber Datenkraken.*
