# ansible-instalar-jenkins-centos-8
Playbook para implentar Jenkins en sistemas Centos 8

# Preparar los nodos a gestionar

Como ROOT>>

Generar clave ssh en el nodo de control se creará en ~/.ssh/id_rsa.pub

`ssh-keygen -t rsa`

Copiar la clave pública en el script ubicado en preparara_nodos_administrados

`preparar_nodos_administrados\preparar_nodos.sh`

Ejecutar el script en los nodos administrados

# Ejecutar playbook de instalación para Jenkins
Modificar el fichero 'inventory.ini' con el nodo donde se va a realizar la instalación

ejemplo:

```
[jenkins_master]
jenkins-master ansible_host=192.168.205.220

[jenkins_slaves]

```

Para ejecutar el playbook

`ansible-playbook _roles.yaml -vv`