require 'pry'

class BadAuthentication < Sinatra::Base
  enable :raise_errors
  disable :show_exceptions
  set :views, File.expand_path("../../views",__FILE__)

  get '/unauthenticated' do
    status 401
    erb :unauthenticated
  end
end