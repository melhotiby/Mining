set :application, "mining"
set :deploy_to, "/srv/#{application}"
set :keep_releases, 3

set :scm, :git
set :repository,  "git@github.com:railsdevmatt/Mining.git"
set :git_shallow_clone, 1
set :branch, "master"
set :use_sudo, true

set :user, "ubuntu"
ssh_options[:forward_agent] = true
default_run_options[:pty] = true

role :app, "23.21.197.126"
role :web, "23.21.197.126"
role :db,  "23.21.197.126", :primary => true

after 'deploy:update_code', 'deploy:symlink_db'


namespace :deploy do

  desc "Restart Application"
  task :restart, :roles => :app do
    run "touch #{deploy_to}/#{shared_dir}/tmp/restart.txt"
  end
  
  desc "Symlinks the database.yml"
  task :symlink_db, :roles => :app do
    run "ln -nfs #{deploy_to}/shared/config/database.yml #{release_path}/config/database.yml"
  end
  
  
  # desc "Update the crontab file"
  # task :whenever, :roles => :cron do
  #   run "cd #{current_path} && RAILS_ENV=#{whenever_environment} whenever --update-crontab #{application}", :shell => false
  # end
end