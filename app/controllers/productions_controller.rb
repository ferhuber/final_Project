class ProductionsController < ApplicationController
  before_action :find_product_id, only: [:create]
  before_action :find_order_id, only: [:create, :new]

  def production_params
     production_params = params.require(:production).permit(:quantity)
  end

  def new
    # render json:[params]

    @production = Production.new
    @products_t = Product.all.pluck(:title).uniq
    # @flavours = Flavour.all.pluck(:flavour).uniq
  end

  def create
    # render json:[params]
    @production = Production.new production_params
    @products_t = Product.all.pluck(:title).uniq
    @production.product_id = @product.id
    @production.order_id = @order.id
    @products = Product.where(id: @product.id)

    if (@production.save)
      # CommentsMailer.notify_post_owner(@comment).deliver_later
    redirect_to new_order_production_path(@order.id)
    end
  end

 def show


 end


  def find_product_id
    @product = Product.find_by(title: params[:products] )
  end

  def find_order_id
    @order = Order.find(params[:order_id])
  end
end
