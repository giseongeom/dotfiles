# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# ssh-agent
if [ -n "$SSH_AGENT_PID" ] ; then
    eval `ssh-agent -k`  >/dev/null 2>&1
fi

