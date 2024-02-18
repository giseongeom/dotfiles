# zshrc_local.zsh

# fastfetch
if [[ -x "$(command -v fastfetch)" ]] && [[ -n "$WSL_DISTRO_NAME" ]] && [[ -z "$LENS_SESSION" ]] && [[ -z "$IDEA_JDK" ]] && [[ -z "$TERM_PROGRAM" ]];
then
    fastfetch --logo android
fi


# Perforce / $P4CONFIG
if [[ -f ${HOME}/.p4config ]];
then
    export P4CONFIG=${HOME}/.config/p4/p4config
fi

# Enable gsudo cache on inside Git Bash/Zsh
# gsudon() {
#     my_zsh_pid=$(ps -p $$ | awk 'NR==2{print $4;exit}')
#     gsudo cache on -p $my_zsh_pid
# }

# zsh
autoload -Uz compinit && compinit
