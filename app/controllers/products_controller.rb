class ProductsController < ApplicationController
  # before_action :authenticate_customer!, except: [:show, :index]
  # before_action(:find_product, { except: [:create, :new, :index] })
  #
  #
  # before_action :authorize, only: [:edit, :destroy, :update]

  def new
    @product  = Product.new
    @calories = Product.all.pluck(:calories).uniq
    @titles = Product.all.pluck(:title).uniq
    @flavours = Flavour.all.pluck(:flavour).uniq

  end

  def create
    product_params = params.require(:product).permit([:id, :title, :product, :image, :calories,:description])
    @product = Product.new(product_params)
    # @product.customer_id = current_customer.id
    if @product.save

      redirect_to products_path(@product)
    else
      render :new
    end
  end

  def index
    @images = Product.all
    @products = Product.order(created_at: :desc)
    @calories = Product.all.pluck(:calories).uniq
    @flavours = Flavour.all.pluck(:flavour).uniq
    @types = Type.all.pluck(:type_of).uniq
  end

  def show
    # @products = Product.all
    # @calories = Product.all.pluck(:calories).uniq
    # @flavours = Flavour.all.pluck(:flavour).uniq
    # @types = Type.all.pluck(:type_of).uniq

    # @test = Product.all

    @product = Product.find params[:id]
    @flavours = @product.flavours
    @types = @product.types

    respond_to do |format|
     format.html { render } # might need to specify the view
     format.json { render json: {product: @product, flavours: @flavours, types: @types} }
    end
  end

  def destroy
    product = Product.find params[:id]
    product.destroy
    redirect_to products_path
  end

  def edit
  end

  def updat
  end

  def destroy
  end

  # def liked_by?(customer)
  #   likes.exists?(customer: customer)
  # end
  #
  # def like_for(customer)
  #   likes.find_by(customer: customer)
  # end


  def products_params
  params.require(:product).permit(:flavours, flavours_attributes: [:id, :flavour])
  end



  private

  def find_product
    @test = Product.find(params[:id])
  end

  # def find_comment
  #   @comment = Comment.find params[:id]
  # end

  def authorize
    if cannot?(:manage, @product)
      redirect_to root_path, alert: 'Not authorized!'
    end
  end
end
