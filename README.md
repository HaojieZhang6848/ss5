
[![Docker Pulls](https://img.shields.io/docker/pulls/ocassio/go-socks5-proxy.svg)](https://hub.docker.com/r/ananclub/ss5/)

# Docker image usage

You can start Docker container with the following command (make sure to replace `<USER>` and `<PASSWORD>` placeholders with your own credentials).
if USER env not set then ss5 server NoAuthAuthenticator. The LISTEN if not set then listen 127.0.0.1:1080
```bash
docker run -d --name ss5 --network=host -e USER=<USER> -e PASSWORD=<PASSWORD> -e LISTEN=<LISTEN ADRR> ananclub/ss5
```

# Build
The following command will perform a build of a static binary for Linux.
The result of this build can be used by a scratch Docker image. This reduces container size drastically.

```bash
CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o server .
```

# Special thanks

- The original idea. Actually, this project is just a very lightweight variation of the serj's one:
   https://github.com/serjs/socks5-server
- SOCKS5 server implementation for Go:
   https://github.com/armon/go-socks5
- Article about building minimal Go containers with Docker by Nick Gauthier:
   https://blog.codeship.com/building-minimal-docker-containers-for-go-applications/
