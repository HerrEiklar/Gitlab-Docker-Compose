# GITLAB CONFIGURATION FILE

## Domain to use
external_url ENV['EXTERNAL_SCHEME'] + "://" + ENV['EXTERNAL_DOMAIN']
registry_external_url ENV['REGISTRY_EXTERNAL_SCHEME'] + "://" + ENV['REGISTRY_EXTERNAL_DOMAIN']
mattermost_external_url ENV['MATTERMOST_EXTERNAL_SCHEME'] + "://" + ENV['MATTERMOST_EXTERNAL_DOMAIN']
pages_external_url ENV['PAGES_EXTERNAL_SCHEME'] + "://" + ENV['PAGES_EXTERNAL_DOMAIN']

## Redirect to HTTPS
nginx['redirect_http_to_https'] = false
registry_nginx['redirect_http_to_https'] = false
mattermost_nginx['redirect_http_to_https'] = false
pages_nginx['redirect_http_to_https'] = false

## Listen on Port
nginx['listen_port'] = ENV['EXTERNAL_PORT']
registry_nginx['listen_port'] = ENV['REGISTRY_EXTERNAL_PORT']
mattermost_nginx['listen_port'] = ENV['MATTERMOST_EXTERNAL_PORT']
pages_nginx['listen_port'] = ENV['PAGES_EXTERNAL_PORT']

## Listen on HTTPS
nginx['listen_https'] = false
registry_nginx['listen_https'] = false
mattermost_nginx['listen_https'] = false
pages_nginx['listen_https'] = false

## Sentry
# gitlab_rails['sentry_enabled'] = true
# gitlab_rails['sentry_dsn'] = 'https://<key>@sentry.io/<project>'
# gitlab_rails['sentry_clientside_dsn'] = 'https://<key>@sentry.io/<project>'
# gitlab_rails['sentry_environment'] = 'production'

## some passwords and secrets
gitlab_rails['gitaly_token'] = File.read('/run/secrets/gitlab_auth_token')
gitlab_rails['initial_root_password'] = File.read('/run/secrets/gitlab_root_password')

## Git Data Directory's
git_data_dirs({
  'default' => {
    'path' => '/var/opt/gitlab/git-data'
  },
  'alternative' => {
    'path' => '/var/opt/gitlab/alternative-git-data'
  },
})

## SMTP
gitlab_rails['smtp_enable'] = true
gitlab_rails['smtp_address'] = ENV['SMTP_HOST']
gitlab_rails['smtp_port'] = ENV['SMTP_PORT']
gitlab_rails['smtp_user_name'] = File.read('/run/secrets/gitlab_smtp_user')
gitlab_rails['smtp_password'] = File.read('/run/secrets/gitlab_smtp_password')
gitlab_rails['smtp_domain'] = ENV['SMTP_HOST']
gitlab_rails['smtp_authentication'] = "login"
gitlab_rails['smtp_enable_starttls_auto'] = true
gitlab_rails['smtp_openssl_verify_mode'] = 'peer'
gitlab_rails['gitlab_email_from'] = 'me@' + ENV['EXTERNAL_DOMAIN']
gitlab_rails['gitlab_email_reply_to'] = 'noreply@' + ENV['EXTERNAL_DOMAIN']

#################################################

## Enable Mattermost
mattermost['gitlab_enable'] = true

## Enable packages
gitlab_rails['packages_enabled'] = true
gitlab_rails['packages_storage_path'] = "/var/opt/gitlab/packages"

## Default GitLab Theme
gitlab_rails['gitlab_default_theme'] = 2

## Some other vars
gitlab_pages['access_control'] = true
gitlab_pages['inplace_chroot'] = true
