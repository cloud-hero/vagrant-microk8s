#!/bin/bash -xe

HELM_VERSION=3.2.4
MICROK8S_VERSION=1.23

# Faster than VirtualBox's DNS Server
sed -i 's/127.0.0.53/1.1.1.1/' /etc/resolv.conf

wget https://get.helm.sh/helm-v$HELM_VERSION-linux-amd64.tar.gz
tar -xzf helm-v$HELM_VERSION-linux-amd64.tar.gz
mv linux-amd64/helm /usr/local/bin/helm
rm -rf helm-v$HELM_VERSION-linux-amd64.tar.gz linux-amd64

swapoff -a
sed -i '/swap/d' /etc/fstab

snap install microk8s --classic --channel=$MICROK8S_VERSION/stable

# Waits until K8s cluster is up
sleep 15

microk8s.enable dns
microk8s.enable metallb:192.168.56.100-192.168.56.200

mkdir -p /home/vagrant/.kube
microk8s config > /home/vagrant/.kube/config
usermod -a -G microk8s vagrant
chown -f -R vagrant /home/vagrant/.kube

curl https://get.docker.com | sh -
usermod -aG docker vagrant

# Installing simple self-hosted registry
docker run -d \
  --restart=always \
  --name registry \
  -v "/certs:/certs" \
  -e REGISTRY_HTTP_ADDR=0.0.0.0:5000 \
  -e REGISTRY_HTTP_TLS_CERTIFICATE=/certs/docker.crt \
  -e REGISTRY_HTTP_TLS_KEY=/certs/docker.key \
  -p 5000:5000 \
  registry:2

cp /certs/ca.crt /usr/local/share/ca-certificates/
update-ca-certificates
systemctl restart docker