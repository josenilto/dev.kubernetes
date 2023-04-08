## Dev Kubernetes | Configurações [ ubuntu 20.04 ]


#### Master & Works

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

####


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
