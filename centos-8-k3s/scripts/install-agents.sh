timedatectl set-timezone America/Asuncion && echo Timezone set America/Asuncion

echo setting k3s agent env
. /vagrant/tmp/install-agents-config.sh
echo installing K3S
curl -sfL https://get.k3s.io | sh -