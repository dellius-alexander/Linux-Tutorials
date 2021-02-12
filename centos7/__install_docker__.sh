#!/usr/bin/env bash
##########################################################################
yum install -y yum-utils
yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

yum install -y containerd.io \
docker-ce docker-ce-cli >/dev/null 2>&1
systemctl enable --now docker
wait $!
