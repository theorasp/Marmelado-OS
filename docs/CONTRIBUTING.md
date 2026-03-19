# Contributing to Marmelado OS

Danke für dein Interesse an Marmelado OS! 🍓

## Wie du beitragen kannst

### Bugs melden
- Erstelle ein **Issue** auf GitHub
- Beschreibe das Problem so genau wie möglich
- Füge Log-Ausgaben bei (`journalctl -xe`)

### Features vorschlagen
- Erstelle ein Issue mit dem Label `enhancement`
- Erkläre warum das Feature nützlich wäre

### Code beitragen
1. Fork das Repository
2. Erstelle einen Branch: `git checkout -b feature/mein-feature`
3. Mache deine Änderungen
4. Teste sie (idealerweise in einer VM)
5. Öffne einen Pull Request

## Bereiche wo Hilfe gebraucht wird

- **Wallpapers** — Mehr Hintergrundbilder (muss frei lizenziert sein!)
- **GRUB Theme** — Verbesserungen am Bootloader-Design
- **Installer** — Bessere Fehlerbehandlung, LUKS-Verschlüsselung
- **Dokumentation** — Übersetzungen, mehr Anleitungen
- **Testing** — Verschiedene Hardware testen und reporten

## Code-Stil

- Shell-Skripte: `set -euo pipefail`, Kommentare auf Deutsch oder Englisch
- XML-Konfigurationen: immer kommentieren was sie tun
- Commit-Messages auf Englisch oder Deutsch

## Lizenz

Mit deinem Beitrag stimmst du zu, dass der Code unter der **GPL-3.0** Lizenz veröffentlicht wird.
