#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails3BootstrapDeviseCancan::Application.load_tasks

require 'resque/tasks'
task "resque:setup" => :environment

## To Start Redis
# 
#     $ redis-server /usr/local/etc/redis.conf

## To start Resque Workers
#
#     $ rake resque:work QUEUE='*'
# 


#
# The following enqueues one unit of poster work for a resque worker
# 

require_relative 'app/jobs/poster'

task :post do
  Resque.enqueue(Poster,{ :test => 'me'})
end

