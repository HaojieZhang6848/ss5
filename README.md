
[![Docker Pulls](https://img.shields.io/docker/pulls/ananclub/ss5.svg)](https://hub.docker.com/r/ananclub/ss5/)[![Build Status](https://travis-ci.org/ananclub/go-socks5-proxy.svg)](https://travis-ci.org/ananclub/go-socks5-proxy) 
# Docker image usage

- You can start Docker container with the following command (make sure to replace `<USER>` and `<PASSWORD>` placeholders with your own credentials).
- if `<USER>`  not set then ss5 server NoAuthAuthenticator. 
- if `<LISTEN>` not set then listen 127.0.0.1:1080
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
- The original idea. Actually, this project is just a very lightweight variation of the ocassio's one:
   https://github.com/ocassio/go-socks5-proxy

- SOCKS5 server implementation for Go:
   https://github.com/armon/go-socks5

