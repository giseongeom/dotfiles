alias ll='ls -l'
alias ls='ls -F --color=auto --show-control-chars'
alias more='less'

# Change code page to UTF-8 but this breaks compatibility
# /c/Windows/System32/chcp.com 65001 > /dev/null 2>&1

if [ -t 1 ] && [ -x /usr/bin/zsh ]; then
    exec zsh
fi
