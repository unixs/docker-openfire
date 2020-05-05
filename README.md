# Openfire in Docker

Dockerized Openfire XMPP server

![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/unixs/openfire?style=flat-square) ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/unixs/openfire/latest?style=flat-square) ![Docker Image Version (latest semver)](https://img.shields.io/docker/v/unixs/openfire?label=latest%20version%20&style=flat-square)

Based on Ubuntu GNU/Linux official image.

## Prepare

### Pull image

```bash
docker pull unixs/openfire
```

### Create local data persistence directory

```bash
mkdir ~/openfire
```

### Prepare local data

**Run it only once.**

NB: `~/openfire` - path to your local data persistence directory.

```bash
docker run -it --rm -v ~/openfire:/var/lib/openfire/persist unixs/openfire bash openfire_init.sh
```

## Start server

### Start Openfire server

```bash
docker run -it -p 9090:9090/tcp --rm -v ~/openfire:/var/lib/openfire/persist unixs/openfire
```

### After start

* Use the web admin to configure your server.
* Open other tcp ports in **Run Openfire server** docker command.
* Start Openfire server with **Run Openfire server** docker comman in detached mode.
* Configure docker logs, autostart & [other cool docker options](https://docs.docker.com/).
