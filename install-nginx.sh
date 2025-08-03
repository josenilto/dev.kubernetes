#!/bin/bash

# Aplicar o NGINX Ingress Controller via manifest oficial
echo "Instalando NGINX Ingress Controller..."
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.10.1/deploy/static/provider/cloud/deploy.yaml

# Aguarda o Ingress Controller ficar pronto
echo "Aguardando o Ingress Controller estar pronto..."
kubectl wait --namespace ingress-nginx \
  --for=condition=Ready pod \
  --selector=app.kubernetes.io/component=controller \
  --timeout=180s

echo "Ingress Controller instalado com sucesso!"
