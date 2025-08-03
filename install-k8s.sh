#!/bin/bash

# Atualizar o sistema
sudo apt-get update
sudo apt-get upgrade -y

# Instalar pacotes necessários
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common

# Adicionar chave GPG do Kubernetes
curl -fsSL https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -

# Adicionar repositório do Kubernetes
sudo add-apt-repository "deb https://apt.kubernetes.io/ kubernetes-xenial main"

# Instalar Kubernetes
sudo apt-get update
sudo apt-get install -y kubelet kubeadm kubectl

# Configurar o Kubernetes (usando kubeadm)
sudo kubeadm init --pod-network-cidr=10.244.0.0/16

# Configurar o ambiente para o usuário atual
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

# Instalar um plugin de rede para o Kubernetes (exemplo: Calico)
kubectl apply -f https://docs.projectcalico.org/manifests/calico.yaml

# Mostrar status do cluster
kubectl get nodes

# Dica: você pode copiar o token gerado pelo `kubeadm init` para adicionar novos nós ao cluster

# Limpar arquivos temporários (opcional)
sudo apt-get clean

echo "Instalação do Kubernetes concluída!"
