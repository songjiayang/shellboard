set :stage, :production

server 'shellboard.com', user: 'deploy', roles: %w{web app db}
set :deploy_to, '/var/www/shellboard'
set :branch, "master"