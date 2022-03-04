timedatectl set-timezone America/Asuncion && echo Timezone set America/Asuncion
if [ ! -f /vagrant/k3s.sh ]; then
    echo "Downloadin k3s installer..."
    curl -sfL https://get.k3s.io -o /vagrant/k3s.sh
fi
cd /vagrant
chmod +x k3s.sh
echo setting k3s agent env...
. /vagrant/tmp/install-agents-config.sh
./k3s.sh