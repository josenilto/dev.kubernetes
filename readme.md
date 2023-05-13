## Dev Kubernetes k8s | Cluster Single e Multi control plane.

<p align="center">
  <a href="https://kubernetes.io">
    <img alt="kubernetes.io" src="https://github.com/josenilto/dev.kubernetes/blob/master/imagens/k8s-hor.png">
  </a>
</p>

✅ **PASSO 00:** Atualizar o servidor verificar se o swap está desativado.



✅ **PASSO 01:** Instalar e configurar pré-requisitos. 

Encaminhando o IPv4 e permitindo que o iptables veja o tráfego em ponte.    
Execute as instruções abaixo mencionadas:

```bash
cat <<EOF | sudo tee /etc/modules-load.d/k8s.conf
overlay
br_netfilter
EOF
```

```bash
sudo modprobe overlay
sudo modprobe br_netfilter
```

sysctl parâmetros exigidos pela configuração, os parâmetros persistem nas reinicializações.
```bash
cat <<EOF | sudo tee /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-iptables  = 1
net.bridge.bridge-nf-call-ip6tables = 1
net.ipv4.ip_forward                 = 1
EOF
```


Aplicar parâmetros sysctl sem reiniciar.
```bash
sudo sysctl --system
```

✅ **PASSO 02:** Install Docker Engine.

Atualize o índice de pacotes e repositório apt.
```bash
sudo apt-get update && sudo apt-get upgrade -y
```

Atualize o índice de pacotes apt e instale pacotes para permitir que o apt use um repositório por HTTPS.
```bash
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
```

Criar o diretório no **`/etc/apt/`**
Adicione a chave GPG oficial do Docker:
```bash
sudo mkdir -m 0755 -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \ 
sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
```

Use o seguinte comando para configurar o repositório:
```bash
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```

Atualize o índice de pacotes e repositório apt.
```bash
sudo apt-get update && sudo apt-get upgrade -y
```

✅ **PASSO 03:** Instalar o containerd

```bash
sudo apt-get install containerd.io
```

✅ **PASSO 04:** Configurado o container runtimes.

```bash
wget \
https://github.com/containernetworking/plugins/releases/download/v1.2.0/cni-plugins-linux-amd64-v1.2.0.tgz
```

```bash
mkdir -p /opt/cni/bin
tar Cxzvf /opt/cni/bin cni-plugins-linux-amd64-v1.2.0.tgz
```

```bash
systemctl status containerd
```

✅ **PASSO 05:** Editando o arquivo **`config.toml`**.

```bash
vim /etc/containerd/config.toml
```

Comenta a **`linha 15.1`** conforme o exemplo abaixo:
**`# disabled_plugins = ["cri"]`**

```bash
[plugins."io.containerd.grpc.v1.cri".containerd.runtimes.runc]
[plugins."io.containerd.grpc.v1.cri".containerd.runtimes.runc.options]
  SystemdCgroup = true
```

```bash
sudo systemctl restart containerd
```

✅ **PASSO 06:** 

Atualize o índice de pacotes e repositório apt.
```bash
sudo apt-get update && sudo apt-get upgrade -y
```

```bash
sudo apt-get install -y apt-transport-https ca-certificates curl
```

Faça o download da chave de assinatura pública do Google Cloud:
```bash
sudo curl -fsSLo /etc/apt/keyrings/kubernetes-archive-keyring.gpg \
https://packages.cloud.google.com/apt/doc/apt-key.gpg
```

Adicione o repositório apt do Kubernetes:
```bash
echo "deb [signed-by=/etc/apt/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | \
sudo tee /etc/apt/sources.list.d/kubernetes.list
```

Atualize o índice de pacotes apt, instale kubelet, kubeadm e kubectl e fixe suas versões:
```bash
sudo apt-get update && sudo apt-get upgrade -y
```
Lista os pacotes disponiveis para instalação:
```bash
sudo apt list -a kubeadm
```
Instalando a versão do kubeadm:
```bash
sudo apt-get install kubeadm=1.27.1-00
```


<h4 align="center"> 
    :construction:  Projeto em construção  :construction:
</h4>

<p align="center">
    <img src="http://img.shields.io/static/v1?label=STATUS&message=EM%20DESENVOLVIMENTO&color=GREEN&style=for-the-badge"/>
</p>