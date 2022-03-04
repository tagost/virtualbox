cat > /vagrant/tmp/install-agents-config.sh  <<EOF
export INSTALL_K3S_VERSION=v1.20.14-rc1+k3s2
export K3S_URL=https://$MASTER_IP:6443
export INSTALL_K3S_EXEC="--node-ip $WORKER_IP --node-external-ip $WORKER_IP"
EOF
echo export K3S_TOKEN=`cat /var/lib/rancher/k3s/server/node-token` >> /vagrant/tmp/install-agents-config.sh