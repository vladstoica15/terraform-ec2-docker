#!/bin/bash
set -eux

apt update -y
apt install -y docker.io

systemctl start docker
systemctl enable docker

docker run -d -p 80:5678 hashicorp/http-echo -text="Hello from Terraform"
