require 'bundler'
Bundler.require

set :env, :development
disable :run

require './client-quickstart.rb'
run Sinatra::Application
