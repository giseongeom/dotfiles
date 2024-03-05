# zlogout

# $HOME/.zsh_history.*
if [[ -f $HOME/.zsh_history ]]; then
    zsh_histfile_num=$(ls -al ~/.zsh_history* 2> /dev/null | wc -l)
    if [[ $zsh_histfile_num -ne 1 ]]; then
        rm -f $HOME/.zsh_history.*
    fi
fi
