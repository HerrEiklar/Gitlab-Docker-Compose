external_url ENV['EXTERNAL_URL']

# Gitaly and GitLab use two shared secrets for authentication, one to authenticate gRPC requests
# to Gitaly, and a second for authentication callbacks from GitLab-Shell to the GitLab internal API.
# The following two values must be the same as their respective values
# of the Gitaly setup
gitlab_rails['gitaly_token'] = File.read('/run/secrets/gitaly_auth_token')
gitlab_rails['initial_root_password'] = File.read('/run/secrets/gitlab_root_password')
gitlab_shell['secret_token'] = File.read('/run/secrets/gitlab_shell_secret_token')

git_data_dirs({
  'default' => { 'gitaly_address' => 'tcp://gitaly:8075' },
})

## Disable components that will not be on the GitLab application server
roles ['application_role']
gitaly['enable'] = false
nginx['enable'] = true
letsencrypt['enable'] = false

## PostgreSQL connection details
gitlab_rails['db_adapter'] = 'postgresql'
gitlab_rails['db_encoding'] = 'unicode'
gitlab_rails['db_host'] = 'postgres' # IP/hostname of database server
gitlab_rails['db_password'] = File.read('/run/secrets/postgres_password')

## Redis connection details
gitlab_rails['redis_port'] = '6379'
gitlab_rails['redis_host'] = 'redis' # IP/hostname of Redis server
gitlab_rails['redis_password'] = File.read('/run/secrets/redis_password')

# Set the network addresses that the exporters used for monitoring will listen on
node_exporter['listen_address'] = '0.0.0.0:9100'
gitlab_workhorse['prometheus_listen_addr'] = '0.0.0.0:9229'
sidekiq['listen_address'] = "0.0.0.0"
puma['listen'] = '0.0.0.0'

# Add the monitoring node's IP address to the monitoring whitelist and allow it to
# scrape the NGINX metrics. Replace placeholder `monitoring.gitlab.example.com` with
# the address and/or subnets gathered from the monitoring node
gitlab_rails['monitoring_whitelist'] = ['10.0.1.0/24', '127.0.0.0/8']
nginx['status']['options']['allow'] = ['10.0.1.0/24', '127.0.0.0/8']

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
