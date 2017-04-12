class ProductsController < ApplicationController
  before_action :find_product_id, only: [:show_image_details]

  def new
    @product  = Product.new
  end

  def index
      # render json:[params]
    @products = Product.order(created_at: :desc)
    @calories = Product.all.pluck(:calories).uniq
    @flavours = Flavour.all.pluck(:flavour).uniq
    @types = Type.all.pluck(:type_of).uniq
  end

  def show
      # render json:[params]
    @products = Product.order(created_at: :desc)
    @calories = Product.all.pluck(:calories).uniq
    @flavours = Flavour.all.pluck(:flavour).uniq
    @types = Type.all.pluck(:type_of).uniq
  end

  def show_image_details
    # render json:[params]
    @product = @product_id
  end

  def products_params
    params.require(:product).permit(:flavours, flavours_attributes: [:id, :flavour])
  end

  private

  def find_product_id
    @product_id = Product.find_by(id: params[:product_id])
  end

end
