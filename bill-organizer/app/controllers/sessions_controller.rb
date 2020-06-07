class SessionsController < ApplicationController

    get '/login' do
         erb :'sessions/new'
    end

    get "/sessions/show" do
        erb :'/sessions/show'
    end


    post '/login' do 
        @user = User.find_by(email: params[:email])

        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect "/sessions/#{@user.id}"
        else
            erb :'/sessions/new'
        end
    end 

    get '/sessions/:id' do
        @user = User.find(params[:id])
        erb :'sessions/show'
    end 

    get '/logout' do
        session.clear
    end

    post '/logout' do
        session.clear
        redirect to "/"
    end 


end