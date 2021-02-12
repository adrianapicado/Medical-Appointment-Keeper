class UserController < ApplicationController

    get '/user/signup' do 
        erb :'/user/new'        
    end
    
    post '/user/signup' do 
    @user = User.create(
        name: params[:name],
        username: params[:username], 
        password: params[:password])
    redirect "user/#{@user.id}"
    end

    get '/user/login' do 
        erb :'/user/login'  
    end

    get '/user/:id' do 
       @user = User.find(params[:id])
       erb :'/user/show'
     end 

    
    get '/logout' do
        session.clear
        redirect '/'
    end
  
  end 