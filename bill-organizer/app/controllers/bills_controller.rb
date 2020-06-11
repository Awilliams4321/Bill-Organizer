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
        @bill = Bill.find_by_id(params[:id])

        if @bill && @bill.user_id == current_user.id 
            erb :'bills/show'
        else
            redirect to "/bills"
        end
    end

    get '/bills' do 
        redirect to "/" if !is_logged_in?
        @bills = current_user.bills
        erb :'bills/index'
    end

    get '/bills/:id/edit' do #UPDATE
        redirect to "/" if !is_logged_in?
        @bill = Bill.find_by_id(params[:id])


        if @bill && @bill.user_id == current_user.id 
            erb :'bills/edit'

        else
            redirect to "/bills"
        end
    end 

    patch '/bills/:id' do #Add 
        redirect to "/" if !is_logged_in?
        @bill = Bill.find_by_id(params[:id])
        @bill.update(
            name: params[:name],
            creditor: params[:creditor],
            balance_owed: params[:balance_owed], 
            monthly_payment: params[:monthly_payment],
            due_date: params[:due_date]
        )
        redirect "/bills/#{@bill.id}"
    end 

    delete '/bills/:id' do #DELETE
        redirect to "/" if !is_logged_in?
        bill = Bill.find_by_id(params[:id])

         bill.destroy if bill && bill.user_id == current_user.id
            redirect to "/bills"
        
    end

end