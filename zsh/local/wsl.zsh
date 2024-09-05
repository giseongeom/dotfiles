# golang
if [ -d "/usr/local/go/bin" ]; then
    PATH="$PATH:/usr/local/go/bin"
fi

if [ -d "$HOME/go/bin" ]; then
    PATH="$HOME/go/bin:$PATH"
fi



# /usr/local/java/bin
if [ -d "/usr/local/java/bin" ] ; then
    PATH="$PATH:/usr/local/java/bin"
    export JAVA_HOME="/usr/local/java"
fi

# aws-cli autocompletion
# https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-completion.html
if [ -f '/usr/local/bin/aws_completer' ]; then
    complete -C '/usr/local/bin/aws_completer' aws
fi


# google-cloud-sdk
export USE_GKE_GCLOUD_AUTH_PLUGIN=True
# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/google-cloud-sdk/completion.zsh.inc"; fi


# azure-cli autocompletion
# https://stackoverflow.com/questions/49273395/how-to-enable-command-completion-for-azure-cli-in-zsh
if [ -f '/etc/bash_completion.d/azure-cli' ]; then
    source '/etc/bash_completion.d/azure-cli'
fi


# nodejs
# Current
if [ -d "/usr/local/lib/nodejs/current/bin" ]; then PATH="$PATH:/usr/local/lib/nodejs/current/bin"; fi
# LTS
if [ -d "/usr/local/lib/nodejs/lts/bin" ]; then PATH="$PATH:/usr/local/lib/nodejs/lts/bin"; fi

# npm
if [ -d "$HOME/.npm-global/bin" ]; then
    PATH="$HOME/.npm-global/bin:$PATH"
fi


# fastfetch
if [[ -x "$(command -v fastfetch)" ]] \
    && [[ -n "$WSLENV" ]] && [[ "$PWD" == "/home/giseongeom" ]] \
    && [[ -z "$LENS_SESSION" ]] \
    && [[ -z "$IDEA_JDK" ]] \
    && [[ -z "$TERM_PROGRAM" ]];
then
    fastfetch
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


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

