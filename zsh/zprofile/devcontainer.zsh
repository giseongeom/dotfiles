# linuxbrew
if [[ $PATH != *linuxbrew* ]] && [[ -d "/home/linuxbrew/.linuxbrew/bin" ]]; then
    eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
fi

if [[ -x "$(command -v brew)" ]]; then
    FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
fi

