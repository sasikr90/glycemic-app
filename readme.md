How to install ArgoCD:


kubectl create namespace argocd

kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml


kubectl get pods -n argocd

#Docker Desktop/local cluster, easiest option is port-forward:

kubectl port-forward svc/argocd-server -n argocd 8080:443

https://localhost:8080

#Get admin password:

kubectl get secret argocd-initial-admin-secret -n argocd -o jsonpath="{.data.password}" | base64 -d


Username: admin

#Once Argo CD is installed, apply your app definition:

kubectl apply -f argocd/glycemic-app.yaml -n argocd