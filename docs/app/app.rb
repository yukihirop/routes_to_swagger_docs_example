require 'sinatra'

class App < Sinatra::Base
  set :public_folder, File.expand_path('../..', __FILE__)

  get('/') { redirect "/index.html", 301 }
end