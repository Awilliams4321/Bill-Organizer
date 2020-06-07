class UsersController < ApplicationController

    get '/users/signup' do 
        erb :'users/new' 
    end

    post '/users' do 
        if params[:email] == "" && params[:password] == ""
            #flash[:error] = "Invalid Email or Password. Please Try Again."
            redirect "/users/signup"
        else
            @new_user = User.create(email: params[:email], password: params[:password])
            session[:user_id] = @new_user.id
            redirect "/users/#{@new_user.id}" 
        end
    end

    get '/users/:id' do
        @new_user = User.find(params[:id])
        erb :'users/show'
    end 



end
