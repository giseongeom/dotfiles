# zlogout

# ssh-agent
if [ -n "$SSH_AGENT_PID" ] ; then
    eval `ssh-agent -k`  >/dev/null 2>&1
fi

