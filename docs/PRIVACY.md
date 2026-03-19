# Marmelado OS — Datenschutz & Privacy

Marmelado OS wurde von Grund auf mit Datenschutz als erstes Ziel entwickelt.

## Was wir standardmäßig schützen

### Firewall (UFW)
- Alle eingehenden Verbindungen werden **standardmäßig blockiert**
- Ausgehende Verbindungen sind erlaubt (Browser, Updates usw.)
- Keine offenen Ports ohne explizite Freigabe
- Grafische Verwaltung mit `gufw`

### DNS — Quad9 (9.9.9.9)
Statt dem Standard-DNS des Internet-Providers wird **Quad9** genutzt:
- Keine Protokollierung von DNS-Anfragen
- Blockiert bekannte Malware-Domains
- Betrieben von einer gemeinnützigen Organisation
- Rechenzentren in Europa (DSGVO-konform)

### MAC-Adress-Randomisierung
- Bei jeder WLAN-Verbindung wird eine **zufällige MAC-Adresse** genutzt
- Verhindert Tracking durch Router oder öffentliche Hotspots
- Aktiviert für WLAN-Scan und Verbindungen

### Chromium — Privacy-Flags
Chromium startet mit folgenden Flags:
- `--disable-sync` — kein Google-Sync
- `--no-default-browser-check`
- `--disable-background-networking`
- `--disable-client-side-phishing-detection`
- `--no-first-run`

Empfohlene Erweiterungen nach der Installation:
- **uBlock Origin** — Werbeblocker
- **Privacy Badger** — Tracker-Blocker
- **Cookie AutoDelete** — automatische Cookie-Bereinigung

### Firejail — App-Sandboxing
Firejail ist installiert und kann genutzt werden, um Apps zu isolieren:
```bash
firejail chromium
firejail libreoffice
```

### Kein Telemetrie
- Marmelado OS sendet **keine Daten** nach Hause
- Kein Nutzungs-Tracking
- Keine automatischen "Verbesserungs-Programme"

---

## Empfehlungen für mehr Privatsphäre

### VPN
```bash
# WireGuard (empfohlen):
sudo pacman -S wireguard-tools

# OpenVPN:
sudo pacman -S openvpn networkmanager-openvpn
```

### Tor Browser
```bash
yay -S tor-browser
```

### System verschlüsseln (LUKS)
Für maximalen Schutz: bei der Installation die Festplatte mit LUKS verschlüsseln.
*(Kommt in einer zukünftigen Version des Installers)*

### DNS over HTTPS (DoH)
```bash
# dnscrypt-proxy installieren:
sudo pacman -S dnscrypt-proxy
sudo systemctl enable --now dnscrypt-proxy
```

---

## Dateien bereinigen

Nutze **BleachBit** (vorinstalliert) zum regelmäßigen Bereinigen:
- Temp-Dateien
- Browser-Cache
- Logs
- Thumbnail-Cache

```bash
# Terminal:
bleachbit --clean system.trash system.tmp browsers.cache
```
