class SessionsController < ApplicationController

    get '/login' do
        erb :'sessions/new'
    end

end