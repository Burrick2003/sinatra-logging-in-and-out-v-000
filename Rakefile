ENV["SINATRA_ENV"] ||= "development"

require 'sinatra/activerecord/rake'
require_relative './config/environment'
require './app/controllers/application_controller'


# Type `rake -T` on your command line to see the available rake tasks.

task :console do
  Pry.start
end
