class OrdersController < ApplicationController
  before_action :authenticate_customer!

before_action :find_order_id, only: [:submit]
  def order_params
     order_params = params.require(:order).permit(:store)
  end

  def event_params
   event_params = params.require(:event).permit(:number_people,
                                                :event_date,
                                                :delivery_date,
                                                :type_of
                                                )
  end

  def new
    @order = Order.new
    @events_t = Event.all.pluck(:type_of)
    @event = Event.new
  end

  def create
# render json:[params]
    @order = Order.new order_params
    @order.customer_id = current_customer.id
    @events = Event.new event_params
    @order.event = @events

     if @order.save && @events.save
       session[:order_id] = @order
       redirect_to new_order_production_path(@order.id)
     else
      render :new
     end
  end

  def show
    @customer = current_customer
  end


  def submit
    @production = Production.last
   OrdersMailer.submit_order(@order).deliver_now
   redirect_to order_path(@order),notice: 'Quotation created successfully!'
  end

  def find_order_id
    @order = Order.find(params[:order_id])
  end

end
