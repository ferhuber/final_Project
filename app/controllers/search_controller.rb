class SearchController < ApplicationController


  def index
    # render json:[params]
    # @products = Product.new
    @products = Product.all
    @calories = Product.all.pluck(:calories).uniq
    @flavours = Flavour.all.pluck(:flavour).uniq
    @types = Type.all.pluck(:type_of).uniq


    @product =Product.joins(:flavours).joins(:types).where(
                                                            "calories <= ?", params[:calories] ).where(
                                                            "flavour ILIKE ?", "%#{params[:flavour]}%").where(
                                                            "type_of ILIKE ?", "%#{params[:type_of]}%"
                                                            )

    # @product_f = @product.where("flavour ILIKE ?", "%#{params[:flavour]}%")
    # @product_t = @product_f.where("type_of ILIKE ?", "%#{params[:type_of]}%")

    # @product = PgSearch.multisearch("mi sugar pota")
    # @product = Product.where(:calories => params[:calories])
    # @product = Product.includes(:calories => params[:calories])


#  p = products_with_flavours_and_types.where("calories < 1000")
# products_with_flavours_and_types = Product.joins(:flavours).joins(:types).where("calories < 1000")
# product_with_vanilla_bean = products_with_flavours_and_types.select{|p| p.flavours.select{|f| f.flavour.downcase == "vanilla bean"}}
# product_with_vanilla_and_gluten_free = product_with_vaniall_bean.select{|p| p.types.select{|t| t.type_of.downcase == "gluten free"}}

    # Product.search_by_title('cake').where('calories > ?', 900)


    render 'products/show'
  end

end
