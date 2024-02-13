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

# nodejs
# Current
if [ -d "/usr/local/lib/nodejs/current/bin" ]; then PATH="$PATH:/usr/local/lib/nodejs/current/bin"; fi
# LTS
if [ -d "/usr/local/lib/nodejs/lts/bin" ]; then PATH="$PATH:/usr/local/lib/nodejs/lts/bin"; fi

# fastfetch
if [[ -x "$(command -v fastfetch)" ]] && [[ -n "$WSL_DISTRO_NAME" ]] && [[ -z "$LENS_SESSION" ]] && [[ -z "$IDEA_JDK" ]] && [[ -z "$TERM_PROGRAM" ]];
then
    fastfetch
fi

# 1password ssh-agent
if [ -f "$HOME/.agent-bridge.sh" ]; then
    source $HOME/.agent-bridge.sh
fi


# krew
if [ -d "$HOME/.krew/bin" ] ; then
    PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
fi


# When LENS Session
if [[ -n "$LENS_SESSION" ]];
then
    cd $HOME
    if [[ -n "$KUBECONFIG" ]];
    then
        chmod 600 $KUBECONFIG
    fi
fi

# Perforce / $P4CONFIG
if [[ -f ${HOME}/.p4config ]];
then
    export P4CONFIG=${HOME}/.p4config
fi

# Kotlin
if [[ -d "/usr/local/lib/kotlin/bin" ]];
then
    export KOTLIN_HOME="/usr/local/lib/kotlin"
    PATH="$PATH:/usr/local/lib/kotlin/bin"

    if [[ -d "/usr/local/lib/kotlin-native/bin" ]];
    then
        PATH="$PATH:/usr/local/lib/kotlin-native/bin"
    fi
fi

