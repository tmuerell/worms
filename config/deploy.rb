$:.unshift(File.expand_path('./lib', ENV['rvm_path'])) # Add RVM's lib directory to the load path.
require "rvm/capistrano"                  # Load RVM's capistrano plugin.
require 'bundler/capistrano'
set :rvm_ruby_string, '1.9.2'        # Or whatever env you want it to run in.
set :rvm_bin_path, '/usr/local/bin'

set :application, "worms"
set :repository,  "ssh://muerell.de/var/git/repos/worms.git"
set :scm, :git

role :web, "muerell.de"                          # Your HTTP server, Apache/etc
role :app, "muerell.de"                          # This may be the same as your `Web` server
role :db,  "muerell.de", :primary => true # This is where Rails migrations will run

set :deploy_to, "/var/www/worms.muerell.de/app"
set :user, "todie"
set :use_sudo, false

ssh_options[:username] = 'todie'

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

before "deploy:assets:precompile", "bundle:install"