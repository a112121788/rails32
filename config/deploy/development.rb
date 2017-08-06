p "dd"

# Basic settings:
#   domain       - The hostname to SSH to.
#   deploy_to    - Path to deploy into.
#   repository   - Git repo to clone from. (needed by mina/git)
#   branch       - Branch name to deploy. (needed by mina/git)

set :term_mode, :system
set :application_name, 'rails32'
set :domain, '192.168.99.233' #'example.com'
set :user, 'dongjunjun' #fetch(:application_name)
set :deploy_to, '/Users/dongjunjun/peng/my/rails_productions/rails32_deploy' #"/home/#{fetch(:user)}/app"
set :repository, 'git@git.oschina.net:a112121788/rails_32.git'
set :branch, 'master'
# set :rvm_use_path, '/etc/profile.d/rvm.sh'

# Optional settings:
#   set :user, 'foobar'          # Username in the server to SSH to.
#   set :port, '30000'           # SSH port number.
#   set :forward_agent, true     # SSH forward_agent.

# shared dirs and files will be symlinked into the app-folder by the 'deploy:link_shared_paths' step.
# set :shared_dirs, fetch(:shared_dirs, []).push('somedir')
set :shared_files, fetch(:shared_files, []).push('config/database.yml', 'config/secrets.yml')


# This task is the environment that is loaded for all remote run commands, such as
# `mina deploy` or `mina rake`.