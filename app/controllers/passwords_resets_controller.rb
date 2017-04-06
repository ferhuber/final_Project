class PasswordsResetsController < ApplicationController
  def new
  end

  def create
    @customer = Customer.find_by(email: params[:password_reset][:email].downcase)
    if @customer
      @customer.create_reset_digest
      @customer.send_password_reset_email
      flash[:success] = "Email sent with password reset instructions"
      redirect_to root_url
    else
      flash.now[:alert] = "Email address not found"
      render 'new'
    end
  end

  def edit
    # render json:[params]
    @customer = Customer.find_by(id: params[:id])
    flash[:modal] = true
  end

  def update
    # render json: params[:customer][:email]
    @customer = Customer.find_by(email: params[:customer][:email])
    if @customer.update(password: params[:customer][:password])
      redirect_to root_path(@customer)
    else
      flash[:modal] = true
      render :edit
    end
  end

end
