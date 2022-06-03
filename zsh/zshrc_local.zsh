# zshrc_local.zsh
export USE_GKE_GCLOUD_AUTH_PLUGIN=True

# ssh-agent
if [ -z "$SSH_AUTH_SOCK" ]; then
    eval `ssh-agent -s`  >/dev/null 2>&1
    ssh-add >/dev/null 2>&1
    ssh-add ~/.ssh/id_rsa_*pem >/dev/null 2>&1
i


