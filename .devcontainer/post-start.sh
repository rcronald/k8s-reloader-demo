#!/bin/bash

# this runs each time the container starts
echo "post-start start"
echo "$(date +'%Y-%m-%d %H:%M:%S')    post-start start" >> "$HOME/status"

# update the base docker images

# install argocd CLI
sudo curl -sSL -o /usr/local/bin/argocd https://github.com/argoproj/argo-cd/releases/download/v2.1.5/argocd-linux-amd64
sudo chmod +x /usr/local/bin/argocd
argocd help
#kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
#argocd login humble-computing-machine-xrjr4ppjqr2vp6g-30004.app.github.dev --insecure
#argocd version
#argocd app list

#argocd app create demo2 \
#--project default \
#--repo https://github.com/codefresh-contrib/gitops-certification-examples \
#--path "./simple-app" \
#--dest-namespace default \
#--dest-server https://kubernetes.default.svc

#argocd app sync demo2

echo "post-start complete"
echo "$(date +'%Y-%m-%d %H:%M:%S')    post-start complete" >> "$HOME/status"
