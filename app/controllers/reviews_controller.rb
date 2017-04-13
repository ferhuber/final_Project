class ReviewsController < ApplicationController
  def rating_params
    rating_params = params.require(:review).permit(:rating , :body)
  end

  def new
    # render json:[params]
    @review = Review.new
  end

  def create
    # render json:[params]
    # @reviews = Review.new rating_params
    @review = Review.new(review_params)
    @review.customer_id = current_customer.id

    if @review.save
    render :new
    end
  end

  def edit
    @review = Review.find(review_params)
  end

  def update
    @review = Review.find(review_params)
  end

  private

  def review_params
    params.require(:review).permit(:rating)
  end


end
