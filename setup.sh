# kind create cluster --config kind/kind-cluster.yaml


kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/download/v0.3.6/components.yaml
kubectl patch deployment metrics-server -n kube-system -p '{"spec":{"template":{"spec":{"containers":[{"name":"metrics-server","args":["--cert-dir=/tmp", "--secure-port=4443", "--kubelet-insecure-tls","--kubelet-preferred-address-types=InternalIP"]}]}}}}'



# docker network inspect -f '{{.IPAM.Config}}' kind

kustomize build metallb/ | kubectl apply -f -




kustomize build argocd/ | kubectl apply -f -
kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'

kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d

# Login to Kubeflow with "email-address" user@kubeflow.org and password 12341234

#docker pull: 
# install from: https://github.com/awslabs/amazon-ecr-credential-helper/releases and put in path
# :~/fox/sm/argoflow $ cat ~/.docker/config.json 
# {
#     "credsStore": "ecr-login"
# }


#microk8s: 
# https://github.com/ubuntu/microk8s/issues/1894