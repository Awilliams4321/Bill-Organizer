class BillsController < ApplicationController

    get '/bills/new' do 
        erb :'bills/new'
    end

    post '/bills' do
        @bill = Bill.create(
            name: params[:name],
            creditor: params[:creditor],
            balance_owed: params[:balance_owed],
            monthly_payment: params[:monthly_payment],
            due_date: params[:due_date]
        )
    end 


end