# wsdd2 container

wsdd2 implements a WSD/LLMNR Discovery/Name Service Daemon. This enables (Samba) hosts to be found by Web Service Discovery Clients like Windows.

- [Guide](#guide)
  - [Run a new wsdd2 instance](#run-a-new-wsdd2-instance)
  - [Environment variables](#environment-variables)

## Guide

### Run a new wsdd2 instance

The command to run this container is:

```sh
podman run -d --rm --name wsdd2 --net=host -e HOSTNAME=$(hostname) registry.opensuse.org/home/kukuk/container/wsdd2
```

### Environment variables:
* DEBUG=[0|1]		Enable debug mode
* HOSTNAME=<hostname>	Samba Netbios name to report.
* WORKGROUP=<name>	Workgroup name
