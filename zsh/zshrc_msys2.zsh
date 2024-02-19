# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="agnoster"
ZSH_THEME="agnoster2clock"

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
DISABLE_UNTRACKED_FILES_DIRTY="true"

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
    zsh-syntax-highlighting
    zsh-autosuggestions
    kube-ps1
)

source $ZSH/oh-my-zsh.sh

# User configuration

# set PATH so it includes user's private bin directories
PATH="$PATH:/c/Users/giseong.eom/bin:/c/Users/giseong.eom/scoop/shims:/c/Users/giseong.eom/AppData/Local/Programs/Microsoft VS Code/bin:/c//Program Files/Docker/Docker/resources/bin"

# $HOME/.local/bin
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# $HOME/bin
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

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

alias pbcopy="clip"
alias k="kubectl"

# kube-ps1
if [[ $plugins == *kube-ps1* ]]; then
    PROMPT=$PROMPT'$(kube_ps1) '
    kubeoff
fi

# aws-cli autocompletion
# https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-completion.html
if [ -x "$(command -v aws_completer)" ]; then
    complete -C "$(command -v aws_completer)" aws
fi

# google-cloud-sdk
# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/google-cloud-sdk/completion.zsh.inc"; fi

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
