class UsersController < ApplicationController

    get '/users/signup' do 
        erb :'users/new' 
    end

    post '/users' do 
        @new_user = User.new(username: params[:username], email: params[:email], password: params[:password])
        if @new_user.save
            redirect "/users/#{@new_user.id}"
        else
            redirect "/users/signup"
        end
    end

    get '/users/:id' do
        @user = User.find(params[:id])
        erb :'users/show'
    end 



end
