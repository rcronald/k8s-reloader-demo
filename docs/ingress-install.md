# Instalar Ingress Controller

## 1. Instalar

Utilizando Kubectl
```
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.1.2/deploy/static/provider/cloud/deploy.yaml
```

Utilizando Helm
```
helm upgrade --install ingress-nginx ingress-nginx \
  --repo https://kubernetes.github.io/ingress-nginx \
  --namespace ingress-nginx --create-namespace
```

## 2. Validar
```
kubectl get pods --namespace=ingress-nginx
```

## 3. Instalar aplicación de ejemplo
```
kubectl create deployment demo --image=nginx --port=80
kubectl expose deployment demo
```

## 4. Crear ingress con ruta demo.localdev.me
```
kubectl create ingress demo-localhost --class=nginx --rule="demo.localdev.me/*=demo:80"
```
Acceder a: [http://demo.localdev.me:8080/](http://demo.localdev.me)