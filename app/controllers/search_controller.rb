class SearchController < ApplicationController

  def index
    # render json:[params]
    # @products = Product.new
    @products = Product.all
    @calories = Product.all.pluck(:calories).uniq
    @ingredients = Ingredient.all.pluck(:ingredient).uniq
    @types = Type.all.pluck(:type_of).uniq


    @product = Product.where(:calories => params[:calories])

    render 'products/show'
  end

end
