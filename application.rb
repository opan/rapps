# Set default value for `RACK_ENV` to 'development'
# So that we can use bundler based on environment
ENV['RACK_ENV'] ||= 'development'

require 'bundler'
Bundler.require :default, ENV['RACK_ENV'].to_sym

require 'sinatra/base'
require 'sinatra/reloader' if development?

require_relative 'config/loader'

# Here `SinatraApp` is our application name
class SinatraApp < Sinatra::Application
  # Set options per template engine, e.g: haml, erb, slim, etc.
  # set :haml, format: :html5

  # Change templates directory. Default is set to './views'
  # set :views, settings.root + '/templates'

  set :root, File.dirname(__FILE__)
  set :port, 4567
  set :server, %(puma webrick thin)

  # Enable sessions in Sinatra
  enable :sessions

  include Loader

  get '/about' do
    haml :about, layout: :main_layout
  end
end

