ENV["RACK_ENV"] ||= "development"
if(ENV['RACK_ENV'] != 'production')
  require 'dotenv'
  Dotenv.load(".env.#{ENV['RACK_ENV']}")
end

require "sinatra/base"
require "sinatra/json"

require_relative "./initializers/sequel"