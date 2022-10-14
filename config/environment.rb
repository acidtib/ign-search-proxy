ENV["SINATRA_ENV"] ||= "development"
ENV['RACK_ENV'] ||= "development"

require "dotenv/load"
require "bundler/setup"
Bundler.require(:default, ENV["SINATRA_ENV"])


require_relative File.join(File.dirname(__FILE__), '../lib/user_agents.rb')
require_relative File.join(File.dirname(__FILE__), '../lib/google.rb')

require_relative File.join(File.dirname(__FILE__), '../main.rb')