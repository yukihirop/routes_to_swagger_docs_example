require 'sinatra'
require 'logger'
require_relative './controllers/access_denied'
require_relative './controllers/bad_authentication'


class App < Sinatra::Base
  use AcccessDenied
  use BadAuthentication
  set :views, File.expand_path("../docs",__FILE__)

  helpers do
    def internal_access?
      headers["HTTP_X_INTERNAL_ACCESS"] === 'OK'
    end

    def team_member?
      env["omniauth.auth"]["info"]["team_member_state"] == "active"
    end

    def index_template
      File.read(File.expand_path("../public/index.html", __FILE__))
    end

    def logger
      @logger ||= Logger.new('sinatra.log')
    end
  end

  before do
    case request.path_info
    when "/auth/githubteammember/callback"
    when "/unauthenticated"
    when "/favicon.ico"
    when "/_images/securocat.png"
    else
      info = request.env.select{|key| key.start_with?("HTTP") || key.start_with?("SERVER") }
      logger.info "Headerが渡ってきているかチェック"
      logger.info headers
      logger.info info
      redirect "/auth/githubteammember", 301      
    end
  end

  get('/auth/:provider/callback') do
    info = env.select{|key| key.start_with?("HTTP") || key.start_with?("SERVER") }
    logger.info "Headerが渡ってきているかチェック(callback)"
    logger.info headers
    logger.info info
    if team_member? && internal_access?
      redirect "/index.html"
    else
      redirect "/unauthenticated"
    end
  end
end 