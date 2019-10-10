#!/usr/bin/env bash


TAG=${1:-"latest"}
NAME=ss5

DOCKERREPO="ananclub"

export CGO_ENABLED=0
go build -a -ldflags '-extldflags "-static"' -o server

strip server

rm -rf Dockerfile

cat <<EOF | tee Dockerfile
FROM scratch
ADD server /
ENV TZ="Asia/Shanghai" LANG=en_US.UTF-8
CMD ["/server"]
EOF

docker build -t ${DOCKERREPO}/${NAME}:${TAG} .
#docker push ${DOCKERREPO}/${NAME}:${TAG}

rm -rf Dockerfile

