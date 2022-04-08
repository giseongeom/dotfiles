# linuxbrew
if [ -d "/home/linuxbrew/.linuxbrew/bin" ] ; then
    eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
fi

FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
