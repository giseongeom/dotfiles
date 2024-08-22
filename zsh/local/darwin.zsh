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


