# system-wide
if [[ -d "/opt/homebrew/bin" ]]; then
    FPATH="$(/opt/homebrew/bin/brew --prefix)/share/zsh/site-functions:${FPATH}"
fi

# user-wide
if [[ ! -d "/opt/homebrew/bin" ]] && [[ -d "$HOME/homebrew/bin" ]]; then
    cd $HOME && eval "$(homebrew/bin/brew shellenv)"
    FPATH="$HOME/homebrew/share/zsh/site-functions:${FPATH}"
fi

# fastfetch
if [[ -x /opt/homebrew/bin/fastfetch ]] \
    && [[ "$TERM_PROGRAM" != "Lens" ]] \
    && [[ -z "$SSH_CLIENT" ]];
then
    /opt/homebrew/bin/fastfetch
fi

