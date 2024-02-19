# zshrc_local.zsh

# fastfetch
if [[ -x "$(command -v fastfetch)" ]] && [[ $TERM_PROGRAM != "vscode" ]];
then
    fastfetch --logo msys2
fi

# Perforce / $P4CONFIG
if [[ -f ${HOME}/.p4config ]];
then
    export P4CONFIG=${HOME}/.config/p4/p4config
fi

# Enable gsudo cache with zsh
if [[ -x "$(command -v sudo)" ]] && [[ -f "/c/Users/giseong.eom/scoop/shims/sudo" ]];
then
    gsudon() {
        my_zsh_pid=$(ps -p $$ | awk 'NR==2{print $4;exit}')
        sudo cache on -p $my_zsh_pid
    }
fi

# zsh
autoload -Uz compinit && compinit
