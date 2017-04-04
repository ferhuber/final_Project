class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def event_params
     event_params = params.require(:event).permit(:type_of ,
                                                  :nun_people,
                                                  :event_date,
                                                  :delivery_date)

  end

  def create

    @event = Event.new event_params
     if @event.save
       session[:event_id] = @event.id
       redirect_to root_path, notice: 'Event created successfully!'
     else
      render :new
     end
  end

  def show
    @events = Event.all
  end


end
