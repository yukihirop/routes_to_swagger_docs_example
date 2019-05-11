require 'sinatra'

class App < Sinatra::Base
  get('/') { redirect "/index.html", 301 }
end