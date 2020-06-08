class BillsController < ApplicationController

    get '/bills/new' do 
        redirect to "/" if !is_logged_in?

        erb :'bills/new'
    end

    post '/bills' do #CREATE
        @bill = Bill.new(
            name: params[:name],
            creditor: params[:creditor],
            balance_owed: params[:balance_owed],
            monthly_payment: params[:monthly_payment],
            due_date: params[:due_date],
            user_id: current_user.id
        )
        if @bill.save
            redirect "/bills/#{@bill.id}"
        else
             erb :'/bills/new'
        end
    end 

    get '/bills/:id' do #READ
        redirect to "/" if !is_logged_in?
        @bill = Bill.find(params[:id])
        erb :'/bills/show'
    end

    get '/bills' do 
        redirect to "/" if !is_logged_in?
        @bills = Bill.all
        erb :'bills/index'
    end

    get '/bills/:id/edit' do #UPDATE
        redirect to "/" if !is_logged_in?
        @bill = Bill.find(params[:id])
        erb :'bills/edit'
    end 

    patch '/bills/:id' do #Add 
        redirect to "/" if !is_logged_in?
        @bill = Bill.find(params[:id])
        @bill.update(
            name: params[:name],
            creditor: params[:creditor],
            balance_owed: params[:balance_owed], #if block 0 if nil or empty
            monthly_payment: params[:monthly_payment],
            due_date: params[:due_date]
        )
        redirect "/bills/#{@bill.id}"
    end 

    delete '/bills/:id' do #DELETE
        bill = Bill.find(params[:id])
        bill.destroy if bill && bill.user_id == current_user.id
        redirect "/bills"
    end

end