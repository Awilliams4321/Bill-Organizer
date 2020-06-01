class SessionsController < ApplicationController

    get '/login' do
         erb :'sessions/new'
    end

    get "/sessions/show" do
        erb :'/sessions/show'
    end


    post '/login' do 
        @new_user = User.find_by(email: params[:email])

        if @new_user && @new_user.authenticate(params[:password])
            session[:user_id] = @new_user.id
            redirect "/sessions/show"
        else
            erb :'/sessions/new'
        end
    end 

    get '/logout' do
        session.clear
    end

    post '/logout' do
        session.clear
        redirect to "/"
    end 


end