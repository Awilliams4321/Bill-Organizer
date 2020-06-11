class UsersController < ApplicationController

    get '/users/signup' do 
        erb :'users/new' 
    end

    post '/users' do 
        @new_user = User.new(email: params[:email], password: params[:password])
        if @new_user.save
            session[:user_id] = @new_user.id
            redirect "/users/#{@new_user.id}" 
        else
            #flash[:error] = "Invalid Email or Password. Please Try Again."
            redirect "/users/signup"
        end
    end

    get '/users/:id' do
        redirect to "/" if !is_logged_in?
        @new_user = User.find(params[:id])
        erb :'users/show'
    end 



end
