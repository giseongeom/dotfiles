# krew
if [[ -d ${HOME}/.krew/bin ]];
then
    export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
fi

# openssh ssh-agent
if [[ -n "$SSH_CLIENT" ]]; then
  if [[ -z "$SSH_AUTH_SOCK" ]]; then
      eval `ssh-agent -s`  >/dev/null 2>&1
      ssh-add >/dev/null 2>&1
      KEY_FILES_NUM=$(ls -al ~/.ssh | grep -i .pem | wc -l)

    if [[ $KEY_FILES_NUM -ge 1 ]]; then
      ssh-add ~/.ssh/*.pem >/dev/null 2>&1
    fi
  fi
fi

# 1password ssh-agent
if [[ -z "$SSH_CLIENT" ]]; then
    export SSH_AUTH_SOCK=~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock
fi

# Perforce / $P4CONFIG
if [[ -f ${HOME}/.p4config ]];
then
    export P4CONFIG=${HOME}/.p4config
    export EDITOR=vim
fi

# fastfetch (SSH connection)
if [[ -x "$(command -v fastfetch)" ]] && [[ -n "$SSH_CLIENT" ]]; then
    fastfetch
fi

# golang
if [ -d "/usr/local/go/bin" ]; then
    PATH="$PATH:/usr/local/go/bin"
fi

if [ -d "$HOME/go/bin" ]; then
    PATH="$HOME/go/bin:$PATH"
fi

# nodejs
# Current
if [ -d "/usr/local/lib/nodejs/current/bin" ]; then PATH="$PATH:/usr/local/lib/nodejs/current/bin"; fi
# LTS
if [ -d "/usr/local/lib/nodejs/lts/bin" ]; then PATH="$PATH:/usr/local/lib/nodejs/lts/bin"; fi


# sublime-text 4 / Mac
# HOWTO: Key repeat issues
# https://forum.sublimetext.com/t/st4-mac-key-repeat-issues/58152/4
# defaults write com.sublimetext.4 ApplePressAndHoldEnabled -bool false
#
# Add subl/smerge PATH
# echo 'export PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin:$PATH"' >> ~/.zprofile
# export PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin:$PATH"
#
# Make subl/smerge link
# ln -sf "/Applications/Sublime Merge.app/Contents/SharedSupport/bin/smerge" ~/bin/smerge
# ln -sf "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" ~/bin/subl

# VScode: Key repeat issue
# https://github.com/VSCodeVim/Vim#mac
# defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false

# Disable ApplePressAndHoldEnabled (globally)
# defaults write -g ApplePressAndHoldEnabled -bool false

# Show hidden files in Finder always
# https://apple.stackexchange.com/questions/302954/permanently-enable-to-show-hidden-system-files-when-searching-in-finder
# defaults write com.apple.finder AppleShowAllFiles -boolean true; killall Finder;

# krew
# export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# awscli
# https://docs.aws.amazon.com/ko_kr/cli/latest/userguide/cli-usage-pagination.html#cli-usage-pagination-awspager
# export AWS_PAGER=''
