#!/bin/bash

# vérification de l'uid (identifiant utilisateur) qui lance le script
if [ "$(id -u)" -ne 0 ]; then
  echo "lancer avec sudo !!!"
  exit 1
fi

# Add Docker's official GPG key:
apt-get update
apt-get install -y ca-certificates curl git jq yq tree
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get update

# install des paquets docker
apt-get install -y docker-ce \
        docker-ce-cli \
        containerd.io \
        docker-buildx-plugin \
        docker-compose-plugin

# ajout de l'utilisateur vagrant au groupe docker 
# autorisé à exécuter des commandes docker sans sudo
usermod -aG docker vagrant
