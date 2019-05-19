require 'pry'
require './app'
require_relative './lib/omniauth-github-team-member/lib/omniauth-github-team-member'
# require_relative './lib/monkey_patches/static_filter'

use Rack::Session::Cookie,
  :secret => Digest::SHA256.hexdigest(rand.to_s),
  :expire_after => 3600

use OmniAuth::Builder do
  provider :githubteammember, ENV['GITHUB_CLIENT_ID'], ENV['GITHUB_CLIENT_SECRET'],
  github_team_id: 3248635
end

run  App