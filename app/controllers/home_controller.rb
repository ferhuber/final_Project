class HomeController < ApplicationController

  def new
    @product  = Product.new
    @calories = Product.all.pluck(:calories).uniq
    @titles = Product.all.pluck(:title).uniq
    @flavours = Flavour.all.pluck(:flavour).uniq
  end

  def index
    @products = Product.order(created_at: :desc)
    @calories = Product.all.pluck(:calories).uniq
    @flavours = Flavour.all.pluck(:flavour).uniq
    @types = Type.all.pluck(:type_of).uniq

      if current_customer.present?
      @location = current_customer

      else
      @location = Location.last
      end
  end

  def show
    @product = Product.find params[:id]
    @flavours = @product.flavours
    @types = @product.types
  end

end
