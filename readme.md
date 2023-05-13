## [ Kubernetes k8s ] Dev | Single control plane e Multi control plane Cluster.



**PASSO 01:** Instalar e configurar pré-requisitos. 

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

**PASSO 02:** Install Docker Engine.

Atualizar repositório apt.
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

Atualizar repositório apt.
```bash
sudo apt-get update && sudo apt-get upgrade -y
```






Configurado o container runtimes.




01 STEP;

The command "cat /etc/os-release" is used to display information about the operating system installed on the system.

```bash
cat /etc/os-release
```

The command "sudo swapoff -a" is used to disable all swap spaces on a Linux system.

```bash
sudo swapoff -a
```

The command "cat /etc/fstab" is used to display the contents of the "/etc/fstab" file on a Linux system.

```bash
cat /etc/fstab
```

The command "sudo apt-get update && sudo apt-get upgrade" is used in Ubuntu and other Debian-based Linux distributions to update and upgrade the software packages installed on the system.

```bash
sudo apt-get update && sudo apt-get upgrade
```

### 02 STEP; Forwarding IPv4

Execute the below mentioned instructions:

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

sysctl params required by setup, params persist across reboots

```bash
cat <<EOF | sudo tee /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-iptables  = 1
net.bridge.bridge-nf-call-ip6tables = 1
net.ipv4.ip_forward                 = 1
EOF
```

Apply sysctl params without reboot

```bash
sudo sysctl --system
```

### 03 STEP; Docker Engine

The command "sudo apt-get update && sudo apt-get upgrade" is used in Ubuntu and other Debian-based Linux distributions to update and upgrade the software packages installed on the system.

```bash
sudo apt-get update && sudo apt-get upgrade
```

Before you install Docker Engine for the first time on a new host machine, you need to set up the Docker repository.   
Afterward, you can install and update Docker from the repository.

Set up the repository Update the apt package index and install packages to allow apt to use a repository over HTTPS:

```bash
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
```

The command "sudo mkdir -m 0755 -p /etc/apt/keyrings" is used to create a directory with specific permissions on Ubuntu and other Debian-based Linux distributions.

Add Docker’s official GPG key:

```bash
sudo mkdir -m 0755 -p /etc/apt/keyrings
```

The command "curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg" is used to download and add the Docker GPG key to the apt keyring on Ubuntu and other Debian-based Linux distributions.


```bash
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
```

Use the following command to set up the repository:

```bash
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```

The command "sudo apt-get update && sudo apt-get upgrade" is used in Ubuntu and other Debian-based Linux distributions to update and upgrade the software packages installed on the system.

```bash
sudo apt-get update && sudo apt-get upgrade
```

The command "sudo apt-get install containerd.io" is used to install the containerd.io package on Ubuntu and other Debian-based Linux distributions.

Containerd.io is a container runtime that provides a way to run and manage containerized applications on Linux. It's often used in conjunction with container orchestration tools such as Docker Swarm, Kubernetes, or Apache Mesos.


```bash
sudo apt-get install containerd.io
```

### 04 STEP; Containerd

https://kubernetes.io/docs/setup/production-environment/container-runtimes/#containerd-systemd

https://github.com/containernetworking/plugins/releases

```bash
wget https://github.com/containernetworking/plugins/releases/download/v1.2.0/cni-plugins-linux-amd64-v1.2.0.tgz
```
```bash
mkdir -p /opt/cni/bin
```

```bash
tar Cxzvf /opt/cni/bin cni-plugins-linux-amd64-v1.2.0.tgz
```

```bash
systemctl status containerd
```

Configuring the systemd cgroup driver 
To use the systemd cgroup driver in /etc/containerd/config.toml with runc, set

```bash
vim /etc/containerd/config.toml
```

```bash
  [plugins."io.containerd.grpc.v1.cri".containerd.runtimes.runc.options]
    SystemdCgroup = true
```

Note:
If you installed containerd from a package (for example, RPM or .deb), you may find that the CRI integration plugin is disabled by default.

You need CRI support enabled to use containerd with Kubernetes. Make sure that cri is not included in thedisabled_plugins list within /etc/containerd/config.toml; if you made changes to that file, also restart containerd.

If you experience container crash loops after the initial cluster installation or after installing a CNI, the containerd configuration provided with the package might contain incompatible configuration parameters. Consider resetting the containerd configuration with containerd config default > /etc/containerd/config.toml as specified in getting-started.md and then set the configuration parameters specified above accordingly.

If you apply this change, make sure to restart containerd:

```bash
sudo systemctl restart containerd
```


















# Índice 

# Descrição do Projeto

# Status do Projeto

# Licença

# Conclusão

#### Master & Works


<h4 align="center"> 
    :construction:  Projeto em construção  :construction:
</h4>

<p align="center">
<img src="http://img.shields.io/static/v1?label=STATUS&message=EM%20DESENVOLVIMENTO&color=GREEN&style=for-the-badge"/>
</p>


```bash
cat /etc/os-release
```
Desativa swap
```bash
sudo swapoff -a
```

Verificar se está desativado
```bash
cat /etc/fstab
```
Atualizar os pacote do seu sistema.
```bash
sudo apt-get update && sudo apt-get upgrade
```

--


Comando realiza o download das imagens de componentes do Kubernetes, como o etcd ou API, antes da criação do cluster?

```bash
kubeadm config images pull
```

Comando inicializa um cluster Kubernetes?

```bash
kubeadm init
```

Comando para adicionar um novo node ao cluster Kubernetes?

```bash
kubeadm join
```

Adicionar um novo node em seu cluster, o comando é executado no node master ou no node a ser adicionado?

```bash
No novo node
```

Comando exibe a linha de comando inteira, inclusive com o token e o ca-cert-hash, para adicionar novos nodes ao cluster?

```bash
kubeadm token create--print-join-command
```

Comando cria um simples pod do Nginx?

```bash
kubectl run ngnix --image ngnix
```

Comando lista os deployment do namespace default?

```bash
kubectl get deploy
```

Como eu posso criar um service para um deployment em execução?

```bash
kubectl expose deployment/name_do_deployment
```

Eu posso ter a swap habilitada em meu cluster?

```bash
não
```

Comando utilizado para visualizar os nodes que fazem parte do meu node?

```bash
kubectl get nodes
```

---

Eu tenho um arquivo .yaml que possui as informações de um deployment que eu preciso criar. A pergunta é: Qual o comando é utilizado para criar um deployment especificado a partir de um arquivo yaml?

```bash
kubectl create -f
```

Qual o comando utilizado para exibir os detalhes sobre determinado deployment, sendo que sua saída deverá ser no padrão yaml?

```bash
kubectl get deploy nome_deployment -o yaml
```

O que melhor define um service node port?

```bash
Permite que determinada porta de todos os nodes do cluster seja utilizada da pelo cliente para acessar os endpoints desse service
```

O que melhor define um service clusterIP?

```bash
Automaticamente realiza a criação de um ip privado, que somente poderá ser acessado de dentro do cluster.
```

O que melhor define um service load balancer?

```bash
Quando integrado com seu cloud provider, automaticamente realiza a criação de um ip publico, que será utilizado pelo cliente para acessar os endpoints desse service
```

Dentro de um arquivo .yaml onde estou definindo as caracteristicas de meu deployment, me bateu a dúvida sobre como é a sintaxe correta quando eu quero destinar apenas 20% de um CPU para o container, você se lembra?

```bash
cpu:0.2
```

Sempre quando estou criando meus yaml para definir um novo deployment, sempre fico na duvida na hora de limitar os recursos como CPU e memória. Qual a finalidade do requests e o limits?

```bash
O requests determina o valor que será garantido ao container, enquanto o limits determina o valor que o container não poderá passar.
```

Como eu faço para criar, via linha de comando, um namespace?

```bash
kubectl create namespace nome_namespace
```

Quando estou criando um LimitRange, o defaultrequest determina o valor que será garantido aos containers, enquanto o limits determina o valor que os containers não poderão ultrapassar.

```bash
Verdade
```

Qual o comando utilizado para que determinado node pare de receber novos containers?

```bash
kubectl taint node nome_do_node key1=value1:NoSchedule
```



<h4 align="center"> 
	🚧 Tutorial de instalação 🚀 Em construção...  🚧	
</h4>
