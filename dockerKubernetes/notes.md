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



# Dockerized .net application


# Multi stage 
COPY --from=1 <from-path> <to-path>

# Docker networks
- container-namnen är uppslagningsbara (DNS)
