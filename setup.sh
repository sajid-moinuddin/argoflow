kind create cluster --config kind/kind-cluster.yaml



kustomize build metallb/ | kubectl apply -f -


kustomize build argocd/ | kubectl apply -f -


kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'

