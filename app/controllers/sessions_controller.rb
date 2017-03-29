class SessionsController < ApplicationController
  def new
  end

  def create
    customer = Customer.find_by_email params[:email]
      if customer&.authenticate(params[:password])
        session[:customer_id] = customer.id
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
