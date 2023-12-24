# linuxbrew
if [ -d "/home/linuxbrew/.linuxbrew/bin" ] ; then
    eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

    if [[ -x "$(command -v brew)" ]]; then
        FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
    fi

fi

