# zshrc_local.zsh

# GKE
if [ -x "$HOME/google-cloud-sdk/bin/gke-gcloud-auth-plugin" ]; then  export USE_GKE_GCLOUD_AUTH_PLUGIN=True; fi

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
    ln -sf /opt/kubectx/completion/_kubectx.zsh $ZSH_CACHE_DIR/completions/_kubectx.zsh
fi

# kubens autocompletion
if [[ -x "$(command -v kubens)" ]] && [[ ! -e $ZSH_CACHE_DIR/completions/_kubens.zsh ]]; then
    ln -sf /opt/kubectx/completion/_kubens.zsh $ZSH_CACHE_DIR/completions/_kubens.zsh
fi

# eksctl autocompletion
if [[ -x "$(command -v eksctl)" ]]; then
    eksctl completion zsh > $ZSH_CACHE_DIR/completions/_eksctl
fi

