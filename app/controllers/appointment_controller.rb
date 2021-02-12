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
            phone: params[:phone]
        )
        redirect "/appointment/#{@appointment.id}"
    end

    ##read##





    ##update##





    ##delete##




end
