require './config/environment'

class ApplicationController < Sinatra::Base

configure do
   set :public_folder, 'public'
   set :views, 'app/views'
   enable :sessions
   set :session_secret, ENV['SESSION_SECRET']
   set :method_override, true
   register Sinatra::Flash
 end

helpers do 

  not_found do
    erb :oops
  end
  
  def logged_in?      
    !!session[:user_id]
  end 

  def current_user
    @current_user ||= User.find(session[:user_id])
  end 

  def redirect_if_not_logged_in
    redirect "/user/login" if !logged_in?
end

def redirect_if_logged_in
    redirect "/appointments" if logged_in?
end

def redirect_if_not_auth(appointment)
    if current_user.id != appointment.id
      redirect "/appointments"
    end
end 

end

get "/" do
  erb :welcome
end

end
