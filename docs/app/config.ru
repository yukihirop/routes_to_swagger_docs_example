require './app'

use Rack::Auth::Basic do |username, password|
  username == "user" && password == "password"
end

run  App