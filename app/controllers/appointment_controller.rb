class AppointmentController < ApplicationController
    ##create##

    get '/appointment/new' do #render form 
        redirect_if_not_logged_in
        erb :'/appointment/new'
    end

    post '/appointment' do #process form 
        @appointment = Appointment.create(
            doctor: params[:doctor],
            clinic: params[:clinic],
            time: params[:time],
            address: params[:address],
            phone: params[:phone],
            description: params[:description]
        )
        current_user.appointments << @appointment 
        redirect "/appointments/#{@appointment.id}"
    end

    ##read##

    get '/appointments' do
        redirect_if_not_logged_in
        @appointments = Appointment.where(user_id: current_user.id)
        erb :'/appointment/index'
    end

    get '/appointments/:id' do
        redirect_if_not_logged_in
        @appointment = Appointment.find(params[:id])
        erb :'/appointment/show'
     end

    ##update##

    get '/appointments/:id/edit' do #RENDER FORM TO UPDATE 
        redirect_if_not_logged_in
        @appointment = Appointment.find(params[:id])
        erb :'/appointment/edit'
    end

    patch '/appointments/:id' do
        @appointment = Appointment.find(params[:id])
        @appointment.update(
            doctor: params[:doctor],
            clinic: params[:clinic],
            time: params[:time],
            address: params[:address],
            phone: params[:phone],
            description: params[:description]
        )
        redirect "/appointments/#{@appointment.id}"
    end

    ##delete##

    delete '/appointments/:id' do 
        @appointment = Appointment.find_by(id: params[:id])
        @appointment.delete
        redirect "/appointments"
    end

end






