alias ll='ls -l'
alias ls='ls -F --color=auto --show-control-chars'
alias more='less'

# https://dev.to/equiman/zsh-on-windows-without-wsl-4ah9
/c/Windows/System32/chcp.com 65001 > /dev/null 2>&1

if [ -t 1 ] && [ -x /usr/bin/zsh ]; then
    exec zsh
fi