
# kubectl completion
type kubectl &> /dev/null
if [[ $? == 0 ]]; then
    source <(kubectl completion zsh)
fi

# minikube completion
type minikube &> /dev/null
if [[ $? == 0 ]]; then
    source <(minikube completion zsh)
fi

