# Instalar Multipass y microk8s

## Instalamos Multipass

Podemos instalarlo tanto en Windows, Mac como Linux.

| OS      | Referencia                                       |
| ------  | ------------------------------------------------ |
| Windows | https://multipass.run/docs/installing-on-windows |
| Mac     | https://multipass.run/docs/installing-on-macos   |
| Linux   | https://multipass.run/docs/installing-on-linux   |

Para esta Demo, utilizaremos la instalación en mac utilizando Homebrew

```sh
# Instalamos Multipass con brew cask
$ brew install --cask multipass

# Verificamos que lo tenemos instalado
$ multipass
```

## Creamos nuestro nodo Linux (Ubuntu)

```sh
# Crearemos una instancia Ubuntu pasando como parámetros nombre del nodo, ram y disco que le asignaremos
$ multipass launch --name demok8s --mem 2G --disk 5G

# Ingresaremos dentro de nuestra instancia ya creada
$ multipass shell demok8s

# Verificamos que estamos dentro de la instancia y escalaremos a root
$ sudo su
```

## Instalamos microk8s

```sh
# Instalamos microk8s
$ snap install microk8s --classic

# Verificamos la instalacion
$ microk8s status --wait-ready

# Verificamos que tenemos kubernetes instalado
$ microk8s kubectl get all --all-namespaces

# Creamos un alias mas corto para kubectl
$ alias k="microk8s kubectl"
```