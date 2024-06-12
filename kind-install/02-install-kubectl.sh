#!/bin/bash
#
# 2023-12-03
#
# NB: À faire en tant que root !
#

# Installation de kubectl

apt-get update && apt-get install -y apt-transport-https curl gnupg2
curl -fsSL https://pkgs.k8s.io/core:/stable:/$KUBE_CTL_VERSION/deb/Release.key | gpg --dearmor -o /usr/share/keyrings/kubernetes-apt-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/$KUBE_CTL_VERSION/deb/ /" > /etc/apt/sources.list.d/kubernetes.list
apt-get update
apt-get install -y kubectl
