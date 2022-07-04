#!/bin/bash
timedatectl set-timezone America/Asuncion && echo Timezone set America/Asuncion

export INSTALL_K3S_VERSION=v1.20.14-rc1+k3s2
export INSTALL_K3S_EXEC="--advertise-address $MASTER_IP --node-ip $MASTER_IP --node-external-ip $MASTER_IP"
echo installing K3S
curl -sfL https://get.k3s.io | sh -

#install helm
yum -y install wget
if [ ! -f /usr/local/bin/helm ]; then
    wget -s https://get.helm.sh/helm-v3.6.1-linux-amd64.tar.gz
    tar -xvzf helm-v3.6.1-linux-amd64.tar.gz
    mv linux-amd64/helm /usr/local/bin/helm
    sudo su - root -c "echo export KUBECONFIG=/etc/rancher/k3s/k3s.yaml >> /root/.bash_profile"
fi

#install app admin-php
(echo "sudo su - root";
echo helm repo add myrepo https://tagost.github.io/helmcharts/
echo helm install admin-php myrepo/admin-php
) |sh