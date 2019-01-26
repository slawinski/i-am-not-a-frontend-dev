# I am not a frontend dev

This is a response to a common misconception that I'm a frontend developer. I'm not. I also do not code backend exclusively. Am I a fullstack? Eventually - yes. Currently - I'm getting there.

## Getting started

Make sure you have Docker and Compose installed and running locally ([click](https://www.docker.com)).

Then run:

```bash
docker-compose up --build
```

## Running the tests

TBD

## Deployment using Kubernetes on Microsoft Azure

After building a docker image you might want to push it to container registry:

```bash
docker login iamnotafedregistry.azurecr.io
docker tag i-am-not-a-frontend-dev_web iamnotafedregistry.azurecr.io/i-am-not-a-frontend-dev_web:v1
docker push iamnotafedregistry.azurecr.io/i-am-not-a-frontend-dev_web:v1
```
After pushing you might want to check what repositories have been pushed and what tags do they have:

```bash
az acr repository list --name iamnotafedregistry --output table
az acr repository show-tags --name iamnotafedregistry --repository i-am-not-a-frontend-dev_web --output table
```

```bash
az aks get-credentials --resource-group iamnotafed-group --name iamnotafed-cluster
az aks browse --resource-group iamnotafed-group --name iamnotafed-cluster

kubectl get nodes
kubectl apply -f all-in-one.yaml
kubectl get pods
kubectl describe deployments iamnotafed-frontend
kubectl get svc
kubectl describe services iamnotafed-frontend-lb

kubectl -n kube-system get pods
kubectl logs --namespace=kube-system $(kubectl get pods --namespace=kube-system -l k8s-app=kube-dns -o name | head -1) -c kubedns
kubectl logs --namespace=kube-system $(kubectl get pods --namespace=kube-system -l k8s-app=kube-dns -o name | head -1) -c dnsmasq
kubectl logs --namespace=kube-system $(kubectl get pods --namespace=kube-system -l k8s-app=kube-dns -o name | head -1) -c sidecar
```

### Troubleshooting

```bash
kubectl exec <pod_name> cat /etc/resolv.conf
kubectl exec <pod_name> -c iamnotafed-frontend -- wget -O- iamnnotafed-frontend-lb
```
In case an image should be deleted from container repository by tag or manifest digest use:
https://docs.microsoft.com/en-us/azure/container-registry/container-registry-delete

In case of ImagePullBackoff error in pods' status visit:
https://docs.microsoft.com/en-us/azure/container-registry/container-registry-auth-aks

in case of errors in kubernetes dashboard run:
```bash
kubectl create clusterrolebinding kubernetes-dashboard --clusterrole=cluster-admin --serviceaccount=kube-system:kubernetes-dashboard
```

https://kubernetes.io/docs/tasks/administer-cluster/dns-debugging-resolution/

## TODOs

✅ README\
✅ Docker\
✅ Webpack\
✅ Linter\
✅ Heroku\
✅ Frontend\
❌ Tests\
❌ PWA\
❌ Angular\
❌ Kubernetes

## License

TBD

## Acknowledgments

TBD
