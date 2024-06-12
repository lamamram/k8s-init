#!/bin/bash
#
# 2024-01-20
#

wget https://get.helm.sh/helm-$HELM_VERSION-linux-amd64.tar.gz
tar xf helm-$HELM_VERSION-linux-amd64.tar.gz
mv linux-amd64/helm /usr/local/bin
rm -fr helm-$HELM_VERSION-linux-amd64.tar.gz linux-amd64
