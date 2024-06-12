#!/bin/bash
#
# 2023-12-03
# Configuration de kubectl

echo '' >>~/.bashrc
echo '' >>~/.bashrc
echo 'complete -o default -F __start_kubectl k' >>~/.bashrc

echo 'source <(helm completion bash)' >>~/.bashrc

cat <<EOF >> ~/.bashrc
source <(kubectl completion bash)
alias k=kubectl
complete -o default -F __start_kubectl k
source <(helm completion bash)

export LS_OPTIONS='--color=auto'
alias ls='ls $LS_OPTIONS'
alias ll='ls $LS_OPTIONS -la'
alias l='ls $LS_OPTIONS -lA'
EOF
source ~/.bashrc
