#!/usr/bin/env bash


TAG=${1:-"latest"}
NAME=ss5

DOCKERREPO="huajuan6848"

docker build -t ${DOCKERREPO}/${NAME}:${TAG} .
docker push ${DOCKERREPO}/${NAME}:${TAG}
