# macbrew
if [[ -d "/opt/homebrew/bin" ]]; then
    FPATH="$(/opt/homebrew/bin/brew --prefix)/share/zsh/site-functions:${FPATH}"
fi

# fastfetch
if [[ -x /opt/homebrew/bin/fastfetch ]]; then
    /opt/homebrew/bin/fastfetch
fi
