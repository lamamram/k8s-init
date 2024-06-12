#!/bin/bash
#
# 2023-12-03
# 2024-02-22
#

set -o nounset
set -o errexit


# Initialisation du clusteur 'stage'
curl -Lo ./kind "https://kind.sigs.k8s.io/dl/${KIND_VERSION}/kind-linux-${KIND_ARCH}"
chmod +x ./kind
export IPV4=$(ip -f inet address show ${KIND_IFACE}|grep -Po 'inet \K[\d.]+')
./kind create cluster --name=${KIND_CLUSTER_NAME} --config=<(envsubst < kcluster.yml)

# Attendre un peu...

echo "Attendre un peu (30s)"
sleep 30

# Installation du CNI *Calico*

kubectl apply -f calico.yml
