#!/bin/sh
# Get the registration token from:
# http://url/root/${project}/settings/ci_cd

container_name=$1
registration_token=$2

docker exec -it ${container_name} \
  gitlab-runner register \
    --non-interactive \
    --registration-token ${registration_token} \
    --locked=false \
    --description docker-stable \
    --url http://gitlab:81 \
    --executor docker \
    --docker-image docker:stable \
    --docker-volumes "/var/run/docker.sock:/var/run/docker.sock" \
    --docker-network-mode gitlab_default

docker restart ${container_name}
