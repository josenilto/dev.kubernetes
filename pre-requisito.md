https://archive.eksworkshop.com/beginner/060_helm/helm_nginx/   
https://grafana.com/grafana/dashboards/?search=fluentd   
https://grafana.com/grafana/dashboards/6417-kubernetes-cluster-prometheus/   
https://grafana.com/grafana/dashboards/13502-minio-dashboard/  
https://grafana.com/grafana/dashboards/13332-kube-state-metrics-v2/  
https://grafana.com/grafana/dashboards/14981-coredns/  
https://grafana.com/grafana/dashboards/1860-node-exporter-full/  
https://grafana.com/grafana/dashboards/8588-1-kubernetes-deployment-statefulset-daemonset-metrics/  
https://grafana.com/grafana/dashboards/10000-kubernetes-cluster-monitoring-via-prometheus/


kubectl version: Garanta que tudo esteja atualizado e conectando corretamente.
```bash
kubectl version
```
kubectl cluster-info: Um resumo das informações do cluster em suas mãos.
```bash
kubectl cluster-info
```
kubectl get nodes: Saiba quem está na sua equipe – os nós de trabalho.
```bash
kubectl get nodes
```
kubectl get pods: Uma visão geral dos pods no namespace.
```bash
kubectl get pods
```
kubectl describe pods: Profunde-se nos detalhes de um pod.
```bash
kubectl describe pod <nome_do_pod>
```
kubectl logs: Diagnósticos rápidos? Verifique os logs.
```bash
 kubectl logs <nome_do_pod> <nome_do_contêiner>
```
kubectl exec: Precisa mexer dentro de um contêiner? Faça-o com segurança.
```bash
kubectl exec -it <nome_do_pod> -c <nome_do_contêiner> -- /bin/sh
```
kubectl apply: Implemente mudanças via arquivos de configuração.
```bash
kubectl apply -f <caminho_do_arquivo>
```
kubectl delete: Limpe recursos indesejados.
```bash
kubectl delete pod <nome_do_pod>
```
kubectl scale: Ajuste o número de réplicas conforme a demanda.
```bash
kubectl scale deployment <nome_do_deployment> --replicas=3
```
kubectl get deployments: Monitore os deployments ativos.
```bash
kubectl get deployments
```
kubectl get services: Fique por dentro dos serviços em ação.
```bash
kubectl get services
```
kubectl expose: Traga visibilidade ao seu Deployment.
```bash
kubectl expose deployment <nome_do_deployment> --type=NodePort --port=<numero_da_porta>
```
kubectl get namespaces: Explore diferentes namespaces.
```bash
kubectl get namespaces
```
kubectl create namespace: Organize seus recursos criando namespaces.
```bash
kubectl create namespace <nome_do_namespace>
```
kubectl config get-contexts: Mantenha-se ciente dos contextos em seu arsenal.
```bash
kubectl config get-contexts
```
kubectl config use-context: Alterne entre contextos conforme a necessidade. 
```bash
kubectl config use-context <nome_do_contexto>
```
kubectl rollout: Gerencie deployments com eficiência.
```bash
kubectl rollout status deployment/<nome_do_deployment>
```
kubectl apply -f -: Seja ágil ao aplicar configurações.
```bash
cat <<EOF | kubectl apply -f - apiVersion: v1 kind: Pod metadata: name: my-pod spec: containers: - name: my-container image: nginx EOF
```
kubectl taint: Gerencie a distribuição de pods de acordo com as características dos nós.
```bash
bash kubectl taint nodes <nome_do_nó> key=value:efeito_da_marcação
```
kubectl expose deploy nginx-deployment --type=LoadBalancer --port=80 --name=nginx-svc
```bash
kubectl expose deploy nginx-deployment --type=LoadBalancer --port=80 --name=nginx-svc
```
Lista somente avisos
```bash
kubectl get events --field-selector type=Warning
```
Lista eventos recentes para todos os recursos do sistema
```bash
kubectl get events
```

```bash

```

```bash

```

```bash

```

```bash

```

```bash

```

https://grafana.com/docs/grafana/latest/setup-grafana/installation/kubernetes/
https://www.itwonderlab.com/ansible-kubernetes-vagrant-tutorial/
https://medium.com/@SambathKumarJ/effortless-kubernetes-setup-a-guide-to-deploying-microk8s-using-terraform-8332851374d2
