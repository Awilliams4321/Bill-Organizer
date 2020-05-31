class UsersController < ApplicationController

    get '/users/signup' do 
        erb :'users/new' 
    end

    post '/users' do 
        new_user = User.new(username: params[:username], email: params[:email], password: params[:password])
        if new_user.save
            session[:user_id] = new_user.id
            redirect to 'users/#{new_user.id}'
        else
            redirect to 'users/signup'
        end
    end

end
