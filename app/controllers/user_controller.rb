class UserController < ApplicationController

    get '/user/signup' do 
        erb :'/user/new'        
    end
    
    post '/user/signup' do 
        @user = User.new(name: params[:name], username: params[:username], password: params[:password])
        if @user.save
            session[:user_id] = @user.id
            redirect "/appointments"
        else
            redirect "/user/signup"
        end

    end

    get '/user/login' do 
        erb :'/user/login'  
    end

    post '/user/login' do
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
           session[:user_id] = @user.id 
           redirect "/appointments"
        else  
           redirect "/user/login"
        end 
  
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