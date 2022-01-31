# Samba container

Samba is a suite of programs that allows SMB/CIFS clients to use the Unix file space, printers, and authentication subsystem.

- [Guide](#guide)
  - [Run a new Samba instance](#run-a-new-samba-instance)
  - [Options](#options)
  - [Environment variables](#environment-variables)
  - [Examples](#examples)

## Guide

### Run a new Samba instance

The command to run this container is:

```sh
podman run -d --rm -p 139:139 -p 445:445 registry.opensuse.org/home/kukuk/container/samba
```

There are no shares configured by default, but additional ones can be added.

### Options:

```sh
podman run -it --rm registry.opensuse.org/home/kukuk/container/samba -h
```

```
 -s <name:path>[:browse:readonly:guest:users:admins:writelist:comment]
    Configure a share.
     * name             Required, name of the share
     * path             Required, exported path of the share
     * browse           Optional, if share is seen in a net view
     * readonly         Optional, if share is read-only or read-write
     * guest            Optional
     * users            Optional, comma separated list of valid users
     * admins           Optional, comma separated list of admin users
     * writelist        Optional, comma separated list of of users with write access
     * comment          Optional, '_' will be replaced with a space
 -u <name:password>[:UID:group:GID]
    Create user with optional UID and group. This option is not recommended
    because the password will be visible by users listing the processes.
     * name             Required, username
     * password         Required, password of user
     * UID              Optional, UID of the user
     * group            Optional, users default group
     * GID              Optional, GID of the group
 -h
    Display help text and exit
```

### Environment variables:
```
  DEBUG=[0|1]           Enable debug mode
  TZ=<timezone>         Set timezone
  WORKGROUP=<name>      Specify name of workgroup, default is 'WORKGROUP'
  USER=<name:password>[:UID:group:GID]
  SHARE=<name:path>[:browse:readonly:guest:users:admins:writelist:comment]
  USER_FILE=<filename>  Specify file containing user entries to create
  SHARE_FILE=<filename> Specify file containing shares to export
```
Additional variables starting with the same name followed by a number are
supported for 'USER' and 'SHARE', e.g. SHARE, SHARE1, SHARE2, ...

USER_FILE and SHARE_FILE expect files which contain one line per entry in
the format of 'USER' and 'SHARE'.

### Examples

Setting the Timezone

```sh
podman run -d --rm -e TZ=CET -p 139:139 -p 445:445 registry.opensuse.org/home/kukuk/container/samba
```

Start an instance with users and export the home directories and a public directory `/export`:

```sh
podman run -d --rm -p 139:139 -p 445:445 -v /home:/home -v /exports:/exports registry.opensuse.org/home/kukuk/container/samba -u admin:bad_password:1021 -u user:bad_password_2 -s Export:/exports:yes:yes:yes
```

