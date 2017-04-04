class SearchController < ApplicationController


  def index
    # render json:[params]
    @calories = Product.all.pluck(:calories).uniq
    @flavours = Flavour.all.pluck(:flavour).uniq
    @types = Type.all.pluck(:type_of).uniq

    # criteria = []]
    # critera << ("calories <= ?", params[:calories]) if params[:calories].present?
    # criteria << ("flavour ILIKE ?," ...) if ..present?
    # critera.join(" AND ")

    # @products = Product.joins(:flavours).joins(:types).where(critera)
    #

    if params[:calories].present? && params[:flavour].present? && params[:types].present?
      @found =Product.joins(:flavours).joins(:types).where(
                                                          "calories <= ?", params[:calories] ).where(
                                                          "flavour ILIKE ?", "%#{params[:flavour]}%").where(
                                                          "type_of ILIKE ?", "%#{params[:type_of]}%")

    elsif params[:calories].present? && params[:flavour].present?
      @found =Product.joins(:flavours).where("flavour ILIKE ?", "%#{params[:flavour]}%").where("calories <= ?", params[:calories] )

    elsif  params[:calories].present?
      @found = Product.where("calories <= ?",params[:calories])
    elsif params[:flavour].present?
      @found = Product.joins(:flavours).where("flavour ILIKE ?", "%#{params[:flavour]}%")
    else params[:types].present?
      @found = Product.joins(:types).where("type_of ILIKE ?", "%#{params[:type_of]}%")
    end

    render 'products/show'
  end

  def show
    @product = Product.find(params[:id] )
  end

  end

  # <% if  @found.present? %>

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
