# zshrc_local.zsh
export USE_GKE_GCLOUD_AUTH_PLUGIN=True

# openssh ssh-agent
#if [ -z "$SSH_AUTH_SOCK" ]; then
#    eval `ssh-agent -s`  >/dev/null 2>&1
#    ssh-add >/dev/null 2>&1
#    KEY_FILES_NUM=$(ls -al ~/.ssh | grep -i .pem | wc -l)
#    if [[ $KEY_FILES_NUM -ge 1 ]]; then
#      ssh-add ~/.ssh/*.pem >/dev/null 2>&1
#    fi
#fi

# 1password ssh-agent
#if [ -f "$HOME/.agent-bridge.sh" ]; then
#    source $HOME/.agent-bridge.sh
#fi

# nodejs
# Current
if [ -d "/usr/local/lib/nodejs/current/bin" ]; then PATH="$PATH:/usr/local/lib/nodejs/current/bin"; fi
# LTS
if [ -d "/usr/local/lib/nodejs/lts/bin" ]; then PATH="$PATH:/usr/local/lib/nodejs/lts/bin"; fi

# krew
if [ -d "$HOME/.krew/bin" ] ; then
  PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
fi

# fastfetch
if [[ -x "$(command -v fastfetch)" ]] && [[ -n "$WSL_DISTRO_NAME" ]];
then
    fastfetch
fi
