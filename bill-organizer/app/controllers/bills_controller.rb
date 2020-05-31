class BillsController < ApplicationController

    get '/bills/new' do 
        erb :'bills/new'
    end

    post '/bills' do #CREATE
        @bill = Bill.create(
            name: params[:name],
            creditor: params[:creditor],
            balance_owed: params[:balance_owed],
            monthly_payment: params[:monthly_payment],
            due_date: params[:due_date]
        )
        redirect "/bills/#{@bill.id}"
    end 

    get '/bills/:id' do #READ
        @bill = Bill.find(params[:id])
        erb :'/bills/show'
    end

    get '/bills' do 
        @bills = Bill.all
        erb :'bills/index'
    end




end