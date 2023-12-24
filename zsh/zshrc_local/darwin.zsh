# zshrc_local.zsh
export USE_GKE_GCLOUD_AUTH_PLUGIN=True

# 1password ssh-agent
export SSH_AUTH_SOCK=~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock

# ssh-agent
#if [ -z "$SSH_AUTH_SOCK" ]; then
#    eval `ssh-agent -s`  >/dev/null 2>&1
#    ssh-add >/dev/null 2>&1
#    ssh-add ~/.ssh/id_rsa_*pem >/dev/null 2>&1
#fi

# sublime-text 4 / Mac
#
# HOWTO: Key repeat issues
# https://forum.sublimetext.com/t/st4-mac-key-repeat-issues/58152/4
# defaults write com.sublimetext.4 ApplePressAndHoldEnabled -bool false
#
# Add subl/smerge PATH
# echo 'export PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin:$PATH"' >> ~/.zprofile
# export PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin:$PATH"

# Make subl/smerge link
# ln -sf "/Applications/Sublime Merge.app/Contents/SharedSupport/bin/smerge" ~/bin/smerge
# ln -sf "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" ~/bin/subl

# VScode: Key repeat issue
# https://github.com/VSCodeVim/Vim#mac
# defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false

# rust - $HOME/.cargo/env
if [[ -f "$HOME/.cargo/env" ]]; then
    source $HOME/.cargo/env
fi
