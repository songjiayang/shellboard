set :stage, :staging

server 'shellboard.com', user: 'deploy', roles: %w{web app db}
set :deploy_to, '/var/www/shellboard-staging'
set :branch, "master"