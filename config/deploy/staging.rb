set :stage, :staging

server '218.244.128.99', user: 'deploy', roles: %w{web app db}
set :deploy_to, '/var/www/shellboard-staging'
set :branch, "master"