# Gitlab docker-compose

Description:
This is supposed to be a gitlab docker-compose stack with the possibility of loadbalancing each component.
You might have to read some gitlab-omnibus docs, in order to undersand how to loadbalance each service.

<!--
## Services

There are mulitple services
-->

## Docs that helped me

INFO: These are CE (Community Edition) docs, meaning they might differ from EE (Enterprise Edition) docs!

* [Architecture](https://docs.gitlab.com/ce/development/architecture.html) <- lot's of links to configurations
* [Architecture with 2k Users](https://docs.gitlab.com/ce/administration/reference_architectures/2k_users.html)
* [Omnibus](https://docs.gitlab.com/omnibus/)
* [Gitaly on it's own server](https://docs.gitlab.com/ce/administration/gitaly/#run-gitaly-on-its-own-server)
* [Load Balancer Ports](https://docs.gitlab.com/ce/administration/load_balancer.html#ports)
* [Nginx Supporting proxied SSL](https://docs.gitlab.com/omnibus/settings/nginx.html#supporting-proxied-ssl)

## Configs

Adjust by preferences, seperated by folders.

## Env Files

INFO: originals will not be pushed, but there are .sample files, rename them

There are env files in multiple locations.
In the root of this project there is a .env file.
At env_files/ there are env files for each service.

## Secrets

INFO: will not be pushed

In the secrets/ folder are all secrets,
there should be following files in there:

* gitlab_root_password.txt
  * User: root
* postgres_password.txt
  * User: postgres
* redis_password.txt
  * User: [X]

## Volumes

INFO: will not be pushed
