class ProductionsController < ApplicationController
  before_action :find_product_id, only: [:create]
  before_action :find_order_id, only: [:create, :new, :destroy]
  before_action :find_production, only: [:destroy]

  def production_params
     production_params = params.require(:production).permit(:quantity, )
  end

  def new
    # render json:[params]
    @production = Production.new
    @products_t = Product.all.pluck(:title).uniq
    # @flavours = Flavour.all.pluck(:flavour).uniq
  end

  def create
    @production = Production.new production_params
    @products_t = Product.all.pluck(:title).uniq
    @production.product_id = @product.id
    @production.order_id = @order.id
    @products = Product.where(id: @product.id)

    if (@production.save)
      respond_to do |format|
        format.html {redirect_to new_order_production_path(@order.id)}
        format.js {}
      end
    else
      # format.html {alert: 'Please, fill the field bellow'}
      # format.js {}
    end
  end

  def destroy
   production = Production.find params[:id]
   production.destroy
   respond_to do |format|
     format.html do
       redirect_to new_order_production_path(@order.id),
                      notice: 'Product deleted!'
     end
     format.js { render }
   end
  end

   private

  def find_product_id
    @product = Product.find_by(title: params[:products] )
  end

  def find_order_id
    @order = Order.find(params[:order_id])
  end

  def find_production
    @production = Production.find params[:id]
  end
end
