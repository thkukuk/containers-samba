# containers-samba

Simple Container images to build a containerized samba server.

## Description

With this collection of containers you can build your containerized SMB/CIFS File, Print, and Authentication Server with samba and wsdd.

## Containers
### samba

This container image provides a samba server.

Instructions: [README](samba/README.md)

### wsdd

This container image provides a Web Service Discovery host Daemon (wsdd) implemented as python script.

Instructions: [README](wsdd/README.md)

### wsdd2

This container image provides a WSD/LLMNR Discovery/Name Service Daemon
(wsdd2) implemented in C.

Instructions: [README](wsdd2/README.md)

### docker-compose

There is a [docker-compose](docker-compose.yaml) configuration file to start
the samba server and wsdd daemon together on one host.
The `volumes` and `command` part of the samba service section needs to be
adjusted first.

#### Usage

Start the containers:
```sh
docker-compose up -d
```

Stop the containers:
```sh
docker-compose down
```

## Issues

If you have any problems with or questions about this image, please contact me through a [GitHub issue](https://github.com/thkukuk/containers-samba/issues).
