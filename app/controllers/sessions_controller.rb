class SessionsController < ApplicationController
  def new
  end

  def create

  customer = Customer.find_by_email params[:email]
    if customer&.authenticate(params[:password])
      session[:customer_id] = customer.id
      customer_ip = request.remote_ip
      Location.create(ip_address: customer_ip, customer: customer)
      # Location.create(ip_address: "65.110.6.36", customer_id: customer.id)
      redirect_to root_path, notice: 'Signed in!'
    else
      flash.now[:error] = 'Wrong credentials'
      render :new
    end
  end

  def destroy
    session[:customer_id] = nil
    redirect_to root_path
  end

end
