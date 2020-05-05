# Openfire in Docker

Dockerized Openfire XMPP server

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

NB: `~/openfire` - path to your ocal data persistence directory.

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
