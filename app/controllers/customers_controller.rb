class CustomersController < ApplicationController
  def new
    @customer = Customer.new
  end

  def customer_params
    customer_params = params.require(:customer).permit(:first_name,
                                                      :last_name,
                                                      :email,
                                                      :address,
                                                      :password,
                                                      :password_confirmation,
                                                      :phone,
                                                      :is_admin)
  end

  def create

    @customer = Customer.new customer_params
    if @customer.save
      session[:customer_id] = @customer.id
      redirect_to root_path, notice: 'Account created successfully!'
    else
      render :new
    end
  end

  def show
    @customer = Customer.find session[:customer_id]
  end

  def edit
    @customer = Customer.find params[:id]
    flash[:modal] = true
  end

  def update
    @customer = Customer.find params[:id]
      if @customer.update(customer_params)
        redirect_to customer_path(current_customer.id)
      else
        render :edit
      end
  end

  def destroy
    customer = Customer.find params[:id]
    customer.destroy
    redirect_to customer_path
  end

  def password
    customer_params = params.permit(:password, :password_confirmation)
    old = params[:current_password]
    @customer = Customer.find params[:customer_id]
    if !@customer&.authenticate(old)
      flash[:modal] = true
      @customer.errors.add(:current_password, 'mismatch')
      render :edit
    elsif old == customer_params[:password] && old == customer_params[:password_confirmation]
      flash[:modal] = true
      @customer.errors.add(:password, 'should be different from old password')
      render :edit
    elsif @customer.update customer_params
      redirect_to edit_customer_path(@customer), alert: 'Password updated!'
    else
      flash.now[:error] = 'Please fix errors!'
      flash[:modal] = true
      render :edit
    end
  end
end
