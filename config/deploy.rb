require 'mina/multistage'
require 'mina/bundler'
require 'mina/rails'
require 'mina/git'
require 'mina/rbenv'

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
task :environment do
  ruby_version = File.read('.ruby-version').strip
  raise "Couldn't determine Ruby version: Do you have a file .ruby-version in your project root?" if ruby_version.empty?

  invoke :'rbenv:load', ruby_version
end

task :setup do

  in_path(fetch(:shared_path)) do

    command %[mkdir -p config]

    # Create database.yml for Postgres if it doesn't exist
    path_database_yml = "config/database.yml"
    database_yml = %[
production:
  database: db/production.sqlite3
  adapter: sqlite3
  pool: 5
  timeout: 5000
development:
  adapter: sqlite3
  database: db/development.sqlite3
  pool: 5
  timeout: 5000
]
    command %[test -e #{path_database_yml} || echo "#{database_yml}" > #{path_database_yml}]
    # Create secrets.yml if it doesn't exist
    path_secrets_yml = "config/secrets.yml"
    secrets_yml = %[production:\n  secret_key_base:\n    #{`rake secret`.strip}]
    command %[test -e #{path_secrets_yml} || echo "#{secrets_yml}" > #{path_secrets_yml}]

    # Remove others-permission for config directory
    command %[chmod -R o-rwx config]
  end

end

desc "Deploys the current version to the server."
task :deploy do
  # uncomment this line to make sure you pushed your local branch to the remote origin
  # invoke :'git:ensure_pushed'
  deploy do
    # Put things that will set up an empty directory into a fully set-up
    # instance of your project.
    # command %[source ~/.bash_profile]
    # invoke :'git:clone'
    # invoke :'deploy:link_shared_paths'
    # invoke :'bundle:install'
    # invoke :'rails:db_migrate'
    # invoke :'rails:assets_precompile'
    # invoke :'deploy:cleanup'

    # on :launch do
      # command "sh #{fetch(:deploy_to)}/current/unicorn_run.sh restart"
    # end
  end

  # you can use `run :local` to run tasks on local machine before of after the deploy scripts
  # run(:local){ say 'done' }
end

# For help in making your deploy script, see the Mina documentation:
#
#  - https://github.com/mina-deploy/mina/tree/master/docs