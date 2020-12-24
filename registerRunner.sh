#!/bin/sh
# Get the registration token from:
# http://url/root/${project}/settings/ci_cd

registration_token=$1

printf "Using token: ${registration_token}"

printf "\nRegistering runner..."

# docker-compose exec runner \
#   gitlab-runner register \
#     --non-interactive \
#     --registration-token ${registration_token} \
#     --locked=false \
#     --description docker-stable \
#     --url http://gitlab:81 \
#     --executor docker \
#     --docker-image docker:stable \
#     --docker-volumes "/var/run/docker.sock:/var/run/docker.sock" \
#     --docker-network-mode gitlab_default

printf "\nRestarting runner..."

docker-compose restart runner

printf "All done"

printf "\n"