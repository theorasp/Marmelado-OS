#!/usr/bin/env bash
# =============================================================================
# Marmelado OS — Welcome message for new terminal sessions
# Place in /etc/skel/.bashrc or source from it
# =============================================================================

# Only show on first interactive login per session
if [[ -z "$MARMELADO_WELCOMED" ]]; then
    export MARMELADO_WELCOMED=1
    echo ""
    echo -e "\033[0;31m  🍓 Marmelado OS\033[0m  — Privacy · Performance · Freedom"
    echo -e "\033[0;90m  ─────────────────────────────────────────────\033[0m"
    echo -e "  \033[0;37mTipp:\033[0m Drücke die \033[1mWindows-Taste\033[0m für das App-Menü"
    echo -e "  \033[0;37mTipp:\033[0m \033[1mStrg+Alt+T\033[0m öffnet ein neues Terminal"
    echo -e "  \033[0;37mTipp:\033[0m \033[1mnmtui\033[0m für WLAN-Verbindung im Terminal"
    echo ""
fi

# Aliases
alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias update='sudo pacman -Syu'
alias install='sudo pacman -S'
alias search='pacman -Ss'
alias remove='sudo pacman -Rns'
alias cleanup='sudo pacman -Sc && sudo bleachbit --clean system.trash system.tmp'

# Prompt: red username, path in white
PS1='\[\033[0;31m\]\u\[\033[0m\]@\[\033[0;31m\]\h\[\033[0m\]:\[\033[1;37m\]\w\[\033[0m\]\$ '
