class AppointmentController < ApplicationController
    ##create##

    get '/appointment/new' do #render form 
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
        redirect "/appointment/#{@appointment.id}"
    end

    ##read##

    get '/appointments' do
        @appointments = Appointment.all
        erb :'/appointment/index'
    end

    get '/appointments/:id' do
        @appointment = Appointment.find(params[:id])
        erb :'/appointment/show'
     end


end









    ##update##





    ##delete##





