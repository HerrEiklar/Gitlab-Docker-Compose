## domain to use
external_url ENV['EXTERNAL_SCHEME'] + "://" + ENV['EXTERNAL_DOMAIN']
registry_external_url ENV['EXTERNAL_SCHEME'] + "://" + ENV['REGISTRY_EXTERNAL_DOMAIN']
mattermost_external_url ENV['EXTERNAL_SCHEME'] + "://" + ENV['MATTERMOST_EXTERNAL_DOMAIN']
pages_external_url ENV['EXTERNAL_SCHEME'] + "://" + ENV['PAGES_EXTERNAL_DOMAIN']

## redirecting to https
nginx['redirect_http_to_https'] = false
registry_nginx['redirect_http_to_https'] = false
mattermost_nginx['redirect_http_to_https'] = false
pages_nginx['redirect_http_to_https'] = false

## listen on port
nginx['listen_port'] = 80
registry_nginx['listen_port'] = 81
mattermost_nginx['listen_port'] = 82
pages_nginx['listen_port'] = 83


## listen on https
nginx['listen_https'] = false
registry_nginx['listen_https'] = false
mattermost_nginx['listen_https'] = false
pages_nginx['listen_https'] = false

## PostgreSQL connection details
postgresql['enable'] = false
gitlab_rails['db_adapter'] = 'postgresql'
gitlab_rails['db_encoding'] = 'utf8'
gitlab_rails['db_host'] = 'postgresql'
gitlab_rails['db_port'] = 5432
gitlab_rails['db_username'] = 'gitlab'
gitlab_rails['db_password'] = File.read('/run/secrets/postgres_password')

## Redis connection details
redis['enable'] = false
gitlab_rails['redis_host'] = 'redis'
gitlab_rails['redis_port'] = 6379
gitlab_rails['redis_password'] = File.read('/run/secrets/redis_password')

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
    'path' => '/var/opt/gitlab/git-data-alternative'
  },
})

## smtp
gitlab_rails['smtp_enable'] = true
gitlab_rails['smtp_address'] = "mail.huber.host"
gitlab_rails['smtp_port'] = 587
gitlab_rails['smtp_user_name'] = "serviceemailuser@huber.host"
gitlab_rails['smtp_password'] = "sWtc3gKRnfrFEi88bswyJgDidQrZ5Bt7"
gitlab_rails['smtp_domain'] = "mail.huber.host"
gitlab_rails['smtp_authentication'] = "login"
gitlab_rails['smtp_enable_starttls_auto'] = true
gitlab_rails['smtp_openssl_verify_mode'] = 'peer'
gitlab_rails['gitlab_email_from'] = 'me@' + ENV['EXTERNAL_DOMAIN']
gitlab_rails['gitlab_email_reply_to'] = 'noreply@' + ENV['EXTERNAL_DOMAIN']

#################################################

# mattermost['gitlab_enable'] = true
gitlab_rails['gitlab_default_theme'] = 2
gitlab_pages['inplace_chroot'] = true

## Uncomment and edit the following options if you have set up NFS
##
## Prevent GitLab from starting if NFS data mounts are not available
##
#high_availability['mountpoint'] = '/var/opt/gitlab/git-data'
##
## Ensure UIDs and GIDs match between servers for permissions via NFS
##
#user['uid'] = 9000
#user['gid'] = 9000
#web_server['uid'] = 9001
#web_server['gid'] = 9001
#registry['uid'] = 9002
#registry['gid'] = 9002
