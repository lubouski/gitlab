#!/bin/sh
# Get the registration token from:
# http://localhost:8080/root/${project}/settings/ci_cd

registration_token=5nzNx8rvJBVCJAj4WkRR

docker exec -it gitlab-runner1 \
  gitlab-runner register \
    --non-interactive \
    --registration-token ${registration_token} \
    --locked=false \
    --description docker-runner \
    --url http://gitlab-web \
    --executor docker \
    --docker-image alpine:latest \
    --docker-volumes "/var/run/docker.sock:/var/run/docker.sock" \
    --docker-network-mode gitlab-network

