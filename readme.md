## Dev Kubernetes

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



<h4 align="center"> 
	🚧 Tutorial de instalação 🚀 Em construção...  🚧	
</h4>
