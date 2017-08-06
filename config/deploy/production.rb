set :application_name, 'rails32'
set :domain, '192.168.99.233' #'example.com'
set :port, '10002'
set :user, 'dongjunjun' #fetch(:application_name)
set :deploy_to, '/Users/dongjunjun/peng/my/rails_productions/rails32_pro' #"/home/#{fetch(:user)}/app"
set :repository, 'git@git.oschina.net:a112121788/rails_32.git'
set :branch, 'master'
