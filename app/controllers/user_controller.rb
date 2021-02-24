class UserController < ApplicationController

    get '/user/signup' do 
        redirect_if_logged_in
        erb :'/user/new'        
    end
    
    post '/user/signup' do 
        @user = User.new(name: params[:name], username: params[:username], password: params[:password])
        if @user.save
            session[:user_id] = @user.id
            redirect "/appointments"
        else
            flash[:alert] = "Please enter all fields"
            redirect "/user/signup"
        end

    end

    get '/user/login' do 
        redirect_if_logged_in
        erb :'/user/login'  
    end


    post '/user/login' do
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
           session[:user_id] = @user.id 
           redirect "/appointments"
        else  
           flash[:alert] = "Please enter all fields"
           redirect "/user/login"
        end 
  
    end

    post '/logout' do
        session.clear
        redirect '/'
    end
  
  end 