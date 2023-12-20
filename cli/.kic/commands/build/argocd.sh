#!/bin/bash

#name: ArgoCD
#short: Build and deploy ArgoCD services


kubectl create namespace argocd

kubectl apply -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml -n argocd
