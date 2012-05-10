# RVM bootstrap
#$:.unshift(File.expand_path("~/.rvm/lib"))
#$:.unshift(File.expand_path('./lib', ENV['rvm_path']))
require 'rvm/capistrano'

set :branch, ENV['BRANCH']

set :rvm_ruby_string, 'ree-1.8.7-2011.02@teambox'
set :rvm_type, :user

require 'bundler/capistrano'

set :application, "teambox"

#set :scm, :subversion
set :scm, :git
set :user, 'ikusei'

#git
set :repository,  "git@github.com:ikusei/teambox.git"
if branch && branch.present?
  set :branch, branch
else
  set :branch, "dev"
end
set :deploy_via, :remote_cache
set :deploy_env, 'production'
set :rails_env, "production"
set :migrate_env, "production"


set :deploy_to, "/home/ikusei/teambox"
set :db_name, "db_#{application}"
set :db_username, "user_#{application}"

set :ip_address, '178.23.121.2'
set :use_sudo, false
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "178.23.121.6"                          # Your HTTP server, Apache/etc
role :app, "178.23.121.6"                          # This may be the same as your `Web` server
role :db,  "178.23.121.6", :primary => true        # This is where Rails migrations will run  



namespace :deploy do
  
  desc "Upgrade and restart the application"
  task :upgrade, :roles => :app do
    #run "cd #{current_release} && git pull"
    #run "cd #{current_release} && /var/lib/gems/1.8/bin/bundle install"
    restart
    clear_caches
  end

  desc "Clear all caches"
  task :clear_caches, :roles => :app do
    #run "cd #{deploy_to} && RAILS_ENV=production rake tmp:cache:clear"
    #run "rm -rf #{current_release}/public/javascripts/cache"
    #run "rm -rf #{current_release}/public/stylesheets/cache"
  end
  
  desc "Migrate the Database"
  task :migrate, :roles => :db do
    run "cd #{current_release} && RAILS_ENV=production bundle exec rake db:migrate"
  end
  
  desc "show status"
  task :status, :role => :web do
    sudo "/var/lib/gems/1.8/bin/passenger-status"
  end
  
  desc "show passenger memory stats"
  task :memory_stats, :role => :web do
    sudo "/var/lib/gems/1.8/bin/passenger-memory-stats"
  end

  desc "Restart the application"
  task :restart do
    run "touch #{current_release}/tmp/restart.txt"
    #run "cd #{current_release} && ruby script/delayed_job stop"
    #run "cd #{current_release} && ruby script/delayed_job -n 1 start"
  end
  
  
  desc "create config database"
  task :setup_db do
    run "ln -sf #{deploy_to}/shared/config/database.yml #{current_release}/config/database.yml"
    run "ln -sf #{deploy_to}/shared/config/redis.yml #{current_release}/config/redis.yml"
    run "ln -sf #{deploy_to}/shared/log #{current_release}/log"
    
  end
    
  namespace :db do

    task :setup, :role => :db do
      set(:db_root_password) { Capistrano::CLI.password_prompt("Enter MySQL ROOT password [noecho]: ") }
      set(:db_password) { Capistrano::CLI.password_prompt("Enter MySQL password for #{application} [noecho]: ") }
      run "mkdir -p #{deploy_to}/shared/config/"

      create = ERB.new(File.read("config/templates/create_database.mysql.erb")).result(binding)
      create_location = "#{deploy_to}/shared/config/create_db_#{application}.sql"
      put create, create_location

      run <<-EOSQL
        mysql --skip-pager --host=localhost --user=root --password=#{db_root_password} < #{create_location};
        rm #{create_location}
      EOSQL
      
      config = ERB.new(File.read("config/templates/database.yml.erb")).result(binding)
      location = "#{deploy_to}/shared/config/database.yml"
      put config, location
    end

  end
  
end

after 'deploy:create_symlink', 'deploy:setup_db'
