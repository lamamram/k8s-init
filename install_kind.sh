sudo chmod -R +x kind-install
cd kind-install
sudo ./01-sysctl.sh
sudo KUBE_CTL_VERSION="v1.30" ./02-install-kubectl.sh
sudo HELM_VERSION="v3.14.0" ./03-install-helm.sh
source env.conf
./04-init-kind.sh
./05-config-kubectl-helm.sh

sudo apt-get update && sudo apt-get install -y vim

