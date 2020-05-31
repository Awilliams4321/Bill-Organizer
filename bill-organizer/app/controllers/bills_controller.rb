class BillsController < ApplicationController

    get '/bills/new' do 
        erb :'bills/new'
    end


end