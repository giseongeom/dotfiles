# zshrc_local.zsh

# kubectl autocompletion
if [[ -x "$(command -v kubectl)" ]]; then source <(kubectl completion zsh); fi

# helm autocompletion
if [[ -x "$(command -v helm)" ]]; then source <(helm completion zsh); fi

# yq autocompletion
# https://stackoverflow.com/questions/71456694/not-sure-where-to-put-completions-with-oh-my-zsh
if [[ -x "$(command -v yq)" ]]; then
    yq shell-completion zsh > $ZSH_CACHE_DIR/completions/_yq
fi

# kubectx autocompletion
if [[ -x "$(command -v kubectx)" ]] && [[ ! -e $ZSH_CACHE_DIR/completions/_kubectx.zsh ]]; then
    cp -f /opt/kubectx/completion/_kubectx.zsh $ZSH_CACHE_DIR/completions/_kubectx.zsh
fi

# kubens autocompletion
if [[ -x "$(command -v kubens)" ]] && [[ ! -e $ZSH_CACHE_DIR/completions/_kubens.zsh ]]; then
    cp -f /opt/kubectx/completion/_kubens.zsh $ZSH_CACHE_DIR/completions/_kubens.zsh
fi

# eksctl autocompletion
if [[ -x "$(command -v eksctl)" ]]; then
    eksctl completion zsh > $ZSH_CACHE_DIR/completions/_eksctl
fi


# fastfetch
if [[ -x "$(command -v fastfetch)" ]] && [[ $TERM_PROGRAM != "vscode" ]];
then
    fastfetch --logo msys2
    echo''
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
autoload bashcompinit && bashcompinit
autoload -Uz compinit && compinit
