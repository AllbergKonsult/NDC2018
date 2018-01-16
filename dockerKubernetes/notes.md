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
- Overlay networks and VXLAN
- Hur hanteras packet-size
- Hela skickandet mellan host använder UDP!!!!

https://katacoda.com/courses/docker-orchestration/getting-started-with-swarm-mode

Med Docker Swarm, kontrollera att ID i docker info är
unikt!!!

