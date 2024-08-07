# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="robbyrussell"
#ZSH_THEME="bullet-train"
#ZSH_THEME="powerlevel10k/powerlevel10k"
#ZSH_THEME="agnoster2"
#ZSH_THEME="agnoster3clock"
ZSH_THEME="agnoster2clock"
DEFAULT_USER=$USER
#ZSH_THEME="agnosterAfro"
#ZSH_THEME="simple-agnoster"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    brew
    docker
    docker-compose
    zsh-autosuggestions
    zsh-syntax-highlighting
    colored-man-pages
    kube-ps1
    #vi-mode
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias pbcopy="clip.exe"
alias k="kubectl"

# .bash_shared_profile
# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
umask 022

# set PATH so it includes user's private bin directories
PATH="/snap/bin:$PATH:/mnt/c/Users/giseong.eom/bin:/mnt/c/Windows:/mnt/c/Windows/System32:/mnt/c/Users/giseong.eom/AppData/Local/Programs/Microsoft VS Code/bin"

# golang
if [ -d "/usr/local/go/bin" ] ; then
    PATH="$PATH:/usr/local/go/bin"
fi

if [ -d "$HOME/go/bin" ] ; then
    PATH="$HOME/go/bin:$PATH"
fi

# npm
if [ -d "$HOME/.npm-global/bin" ] ; then
    PATH="$HOME/.npm-global/bin:$PATH"
fi

# $HOME/.local/bin
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# $HOME/bin
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# /usr/local/java/bin
if [ -d "/usr/local/java/bin" ] ; then
    PATH="$PATH:/usr/local/java/bin"
    export JAVA_HOME="/usr/local/java"
fi

# kube-ps1
if [[ $plugins == *kube-ps1* ]]; then
    PROMPT=$PROMPT'$(kube_ps1) '
    kubeoff
fi

# aws-cli autocompletion
# https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-completion.html
if [ -f '/usr/local/bin/aws_completer' ]; then
    complete -C '/usr/local/bin/aws_completer' aws
fi

# google-cloud-sdk
# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/google-cloud-sdk/completion.zsh.inc"; fi

# azure-cli autocompletion
# https://stackoverflow.com/questions/49273395/how-to-enable-command-completion-for-azure-cli-in-zsh
if [ -f '/etc/bash_completion.d/azure-cli' ]; then
    source '/etc/bash_completion.d/azure-cli'
fi

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
if [[ -x "$(command -v fastfetch)" ]] \
    && [[ -n "$WSLENV" ]] && [[ "$PWD" == "/home/giseongeom" ]] \
    && [[ -z "$LENS_SESSION" ]] \
    && [[ -z "$IDEA_JDK" ]] \
    && [[ -z "$TERM_PROGRAM" ]];
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

# .zshrc_local.zsh
if [ -f ~/.zshrc_local.zsh ]; then
    source ~/.zshrc_local.zsh
fi

