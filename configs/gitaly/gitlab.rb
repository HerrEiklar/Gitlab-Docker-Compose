# Gitaly and GitLab use two shared secrets for authentication, one to authenticate gRPC requests
# to Gitaly, and a second for authentication callbacks from GitLab-Shell to the GitLab internal API.
# The following two values must be the same as their respective values
# of the GitLab Rails application setup
gitaly['auth_token'] = File.read('/run/secrets/gitaly_auth_token')
gitlab_shell['secret_token'] = File.read('/run/secrets/gitlab_shell_secret_token')

# Avoid running unnecessary services on the Gitaly server
postgresql['enable'] = false
redis['enable'] = false
nginx['enable'] = false
puma['enable'] = false
unicorn['enable'] = false
sidekiq['enable'] = false
gitlab_workhorse['enable'] = false
grafana['enable'] = false

# If you run a separate monitoring node you can disable these services
alertmanager['enable'] = false
prometheus['enable'] = false

# Prevent database connections during 'gitlab-ctl reconfigure'
gitlab_rails['rake_cache_clear'] = false
gitlab_rails['auto_migrate'] = false

# Configure the gitlab-shell API callback URL. Without this, `git push` will
# fail. This can be your 'front door' GitLab URL or an internal load
# balancer.
# Don't forget to copy `/etc/gitlab/gitlab-secrets.json` from web server to Gitaly server.
gitlab_rails['internal_api_url'] = 'http://rails'

# Make Gitaly accept connections on all network interfaces. You must use
# firewalls to restrict access to this address/port.
# Comment out following line if you only want to support TLS connections
gitaly['listen_addr'] = "0.0.0.0:8075"
gitaly['prometheus_listen_addr'] = "0.0.0.0:9236"

# Set the network addresses that the exporters used for monitoring will listen on
node_exporter['listen_address'] = '0.0.0.0:9100'

git_data_dirs({
  'default' => {
    'path' => '/var/opt/gitlab/git-data'
  },
  'storage1' => {
    'path' => '/var/opt/gitlab/git-data1'
  },
})
