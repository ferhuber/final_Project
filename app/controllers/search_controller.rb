class SearchController < ApplicationController


  def index
    # render json:[params]
    # @products = Product.new
    @products = Product.all
    @calories = Product.all.pluck(:calories).uniq
    @ingredients = Ingredient.all.pluck(:ingredient).uniq
    @types = Type.all.pluck(:type_of).uniq


    @product = Product.search_by_calories(params[:calories])


    # @product = Product.where(:calories => params[:calories])
    # @product = Product.includes(:calories => params[:calories])




    render 'products/show'
  end

end


# Product.search_by_title('cake').where('calories > ?', 900)
