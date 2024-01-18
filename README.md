# Realoader meetup

Este repositorio contiene todos los recursos expuestos en el Meetup Nro. 3 de Cloud Native Lima Peru.

## Pre-Requisitos
Para la siguiente demo se requiere utilizar:
- Multipass / microk8s --> Instalación de Multipass
- Rancher Desktop / k3s --> Instalación de Rancher Desktop
- Ingress Controller --> Instalación de Ingress Controller
- ArgoCD --> Instalación de ArgoCD
- Reloader --> Instalación de Reloader

## Paso 1: Instalar aplicaciones

```
kubectl create namespace apps
kubectl apply -f deploy/apps/frontend
kubectl apply -f deploy/apps/backend
```

## Paso 2: Modificar configmap de la aplicación

Sobre el archivo deploy/apps/frontend/frontend-configmap.yaml modificar el contenido con el siguiente valor:
```
apiVersion: v1
kind: ConfigMap
metadata:
  name: frontend-configmap
data:
  TZ: "America/Lima"
  DEMO: "value"
  MESSAGE: "hello cloud native Lima"
```

Sobre el archivo deploy/apps/frontend/frontend-nginx-configmap.yaml modificar el contenido con el siguiente valor:
```
apiVersion: v1
kind: ConfigMap
metadata:
  name: frontend-nginx-configmap
data:
  default.conf: |-
    server {
      listen       80;
      server_name  localhost;
      charset      utf-8;
      tcp_nopush   on;
      tcp_nodelay  on;
      server_tokens off;

      location / {
          root   /usr/share/nginx/html;
          try_files $uri $uri/ /index.html;
          index  index.html;
      }

      location /hello {
          return 200 'Hello Cloud Native Lima 2024!!';
      }
    }

```

## Paso 4: Actualizar Configmap en cluster

```
kubectl apply -f deploy/apps/frontend/frontend-configmap.yaml
kubectl apply -f deploy/apps/frontend/frontend-nginx-configmap.yaml
```

## Paso 3: Instalar Reloader Controller

```
helm repo add stakater https://stakater.github.io/stakater-charts 
helm repo update 
helm install stakater/reloader --generate-name
```

## Paso 4: Limpiar aplicaciones

```
kubectl delete -f deploy/apps/backend --ignore-not-found=true --wait=false
kubectl delete -f deploy/apps/frontend --ignore-not-found=true --wait=false
```

## Paso 5: Instrumentar Reloader

Para reiniciar el pod cuando existen cambios en cualquier de sus secretos o configmap referenciados en el manifiesto de despliegue.

```
kind: Deployment
metadata:
  annotations:
    reloader.stakater.com/auto: "true"
spec:
  template:
    metadata:
...
```

Para reiniciar el pod cuando existen cambios en los secretos o configmap que se especifiquen.

```
kind: Deployment
metadata:
  annotations:
    configmap.reloader.stakater.com/reload: "demo-configmap"
    secret.reloader.stakater.com/reload: "demo-secret"
spec:
  template:
    metadata:
...
```
