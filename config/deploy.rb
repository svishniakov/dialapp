# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'dialapp'
set :repo_url, 'git@github.com:svishniakov/dialapp.git'


# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, '/home/deploy/dialapp'
set :deploy_user, 'deploy'

# Default value for :linked_files is []
set :linked_files, fetch(:linked_files, []).push('config/database.yml', '.env')

# Default value for linked_dirs is []
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/extjs', 'public/images')

namespace :deploy do

  desc "reload the database with seed data"
  task :seed do
    run "cd #{current_path}; rake db:seed RAILS_ENV=#{rails_env}"
  end

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :publishing, :restart
end