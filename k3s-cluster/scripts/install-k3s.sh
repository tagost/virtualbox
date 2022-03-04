#!/bin/bash
if [ ! -f /vagrant/k3s.sh ]; then
    echo "Downloadin k3s installer..."
    curl -sfL https://get.k3s.io -o /vagrant/k3s.sh
fi
cd /vagrant
export INSTALL_K3S_VERSION=v1.20.14-rc1+k3s2
chmod +x k3s.sh 
./k3s.sh --advertise-address $MASTER_IP --node-ip $MASTER_IP --node-external-ip $MASTER_IP 

if [! -f /usr/local/bin/helm]; then
    wget https://get.helm.sh/helm-v3.6.1-linux-amd64.tar.gz
    tar -xvzf helm-v3.6.1-linux-amd64.tar.gz
    mv linux-amd64/helm /usr/local/bin/helm
fi

timedatectl set-timezone America/Asuncion && echo Timezone set America/Asuncion

#Agents config file create
cat > /vagrant/tmp/install-agents-config.sh  <<EOF
export INSTALL_K3S_VERSION=v1.20.14-rc1+k3s2
export K3S_URL=https://$MASTER_IP:6443
export INSTALL_K3S_EXEC="--node-ip $WORKER_IP --node-external-ip $WORKER_IP"
EOF
echo export K3S_TOKEN=`cat /var/lib/rancher/k3s/server/node-token` >> /vagrant/tmp/install-agents-config.sh