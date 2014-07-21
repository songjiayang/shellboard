set :stage, :production

server '218.244.128.99', user: 'deploy', roles: %w{web app db}