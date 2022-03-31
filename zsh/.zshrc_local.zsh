# kube-ps1
if [ -f /home/linuxbrew/.linuxbrew/opt/kube-ps1/share/kube-ps1.sh ]; then
    source "/home/linuxbrew/.linuxbrew/opt/kube-ps1/share/kube-ps1.sh"
    PS1='$(kube_ps1)'$PS1
    kubeoff
fi

