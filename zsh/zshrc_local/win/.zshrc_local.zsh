# zshrc_local.zsh


# fastfetch
if [[ -x "$(command -v fastfetch)" ]];
then
    fastfetch --logo chrom
fi

# Perforce / $P4CONFIG
if [[ -f ${HOME}/.p4config ]];
then
    export P4CONFIG=${HOME}/.config/p4/p4config
fi

