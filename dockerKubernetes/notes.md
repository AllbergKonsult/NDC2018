Running Docker and Kubernetes
=============================

- Ben Hall
- Katacoda.com - interactive browserbased labs

- Kan inte sniffa trafik från andra containers… Kolla upp stöd för sniffing.


Other container runtimes:
- cri-o (redhat-alternativ som är mindre komplex)
- containerd
- rocket

# Kom ihåg.
- Lägg alltid till MachineName/Hostname i loggen
  för debugging.
- docker history <image>
- titta på gitlab.



# Dockerized .net application


# Multi stage 
COPY --from=1 <from-path> <to-path>

# Docker networks
- container-namnen är uppslagningsbara (DNS)

# docker-compose
docker-compose scale 42 för att skala upp och ner

# Security
docker pull someimage:sha256:a1234567890

registrys:
- microbadger
- redhat atomic registry
- jfrog
- aquasec

https://github.com/coreos/clair

https://katacoda.com/courses/docker-security/image-scanning-with-clair

docker run --read-only \
    -v /data:/data \
    elasticsearch

FROM nginx
RUN adduser nonroot
USER nonroot

docker run -u 1000 -d nginx

uptime
free -m
reboot
shutdown now


Restrictions
cgroups - how much of something can I use?
namespaces - what can I see?
capabilities - What can I do?
secccomp - What can I call?
apparmor - What can my app do?

using net=host makes shutdown from container shutdown host
using --name=host makes it possible to get processos from host

docker run --pid=container:web -it ubuntu bash
docker run --net=container:web -it ubuntu bash

bash
:(){ :|: & };:

docker run -it --pids-limit 10

"Understanding and hardening Lunux containers" page 96:
"Docker offers strong defaults for common applicaitons, 
especially when this is compared to linux capabilitites 
of LXC and several default weaknesses of CoreOS Rkt"

# Dockers in production
- Azure Container Instances

# Docker in production
## Docker Swarm
- Overlay networks and VXLAN
- Hur hanteras packet-size?
- Hela skickandet mellan host använder UDP!!!!

https://katacoda.com/courses/docker-orchestration/getting-started-with-swarm-mode

Med Docker Swarm, kontrollera att ID i docker info är
unikt!!!

Saker byggda ovanpå swarm:
- portainer.io

CoreOS Tectonic - Enterprise Kubernetes

## Kubernetes
https://katacoda.com/courses/kubernetes/getting-started-with-kubeadm

kubeadm för att välja version: --kubernetes-version v1.8.0

kubectl get pods -w
-w checks periodically status


kubernetes NetworkPolicy 
    = Firewall definition
    = docker networks
    
## Kubernetes networking
NodePort = Hardcoded port
ClusterIP = Cluster Assigned IP
LoadBalancer = Public IP Assigned by Cloud

https://katacoda.com/courses/kubernetes/networking-introduction

#### Cluster IP
This is a "service IP"

#### Target Ports

#### NodePort
Static port on all

#### External IPs

#### Load Balancer


## Kubernetes Ingress
https://katacoda.com/courses/kubernetes/create-kubernetes-ingress-routes
Ingress controls how to route traffic for a CNAME
to a Kubernetes service.

nginx -T

# Limits
spec:
  hard:
    pods: "4"
    requests.cpu: "1"
    requests.memory: 1Gi
    limits.cpu: "2"
    limits.memory: 2Gi

## Kubernetes persistent data

Create Volume:
kind: PersistentVolume
spec:
  accessModes:
    - ReadWriteOnce
    - ReadWriteMany
  nfs:
    server: <server-name>
    path: <path>

Claim Volume:
name: claimName
kind: PersistentVolumeClaim
spec:
  accessModes:
     - ReadWriteOnce
  resources:
    requests:
      storage: 3Gi


spec:
  volumeMounts:
  - name: asdf
    mountPath: /var/lib&/mysql/data

volumes:
  - name: asdf
    persistemtVolumeClaim:
      claimName: claimName


https://katacoda.com/courses/kubernetes/storage-introduction

https://kubernetes.io/docs/tutorials/stateful-application/basic-stateful-set

## Kubernetes storage services
Rook.io - On-Premise Data Persistence as a Service
StorageOS - 

## Kubernetes Operators
An operator represents human operational knowledge in 
software to reliably manage an application.

example: etcd-operator

## Openshift
https://learn.openshift.com/

## Istio
Connect, manage and secure microservices

https://katacoda.com/courses/istio/deploy-istio-on-kubernetes

# Windows
beta.kubernetes.io/os: windows

# Good commands
docker ps

## Execute in existing container
docker exec -it <target> /bin/bash

docker stats
docker run sysdiag
csysdig

# Promethius
https://prometheus.io/

annotations:
  prometheus.io/scape: 'true'

# dockerbench.com
https://github.com/docker/docker-bench-security

