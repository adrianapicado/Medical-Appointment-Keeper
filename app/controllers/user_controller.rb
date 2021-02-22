class UserController < ApplicationController

    get '/user/signup' do 
        erb :'/user/new'        
    end
    
    post '/user/signup' do 
        if !params[:username].empty? && !params[:password].empty? && !User.find_by_username(params[:username])
           User.create(username: params[:username], password: params[:password])
           session[:user_id] = user.id
           redirect "/appointments"
        else
            redirect "/user/signup"
        end
    end

    get '/user/login' do 
        erb :'/user/login'  
    end

    post '/user/login' do
    end



    # get '/user/:id' do 
    #    @user = User.find(params[:id])
    #    erb :'/user/show'
    #  end 

    
    get '/logout' do
        session.clear
        redirect '/'
    end
  
  end 