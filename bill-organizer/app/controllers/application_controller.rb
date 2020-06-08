require './config/environment'
require 'sinatra/flash'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, 'secret'
    register Sinatra::Flash #Rack::Flash
  end

  get '/' do
    erb :welcome 
  end 

  helpers do 
    def is_logged_in?
      session.has_key?(:user_id)
    end 

    def current_user
      @current_user ||= User.find(session[:user_id]) if is_logged_in?
    end
  end 

end
