class ReviewsController < ApplicationController
  def rating_params
    rating_params = params.require(:review).permit(:rating , :body)
  end

  def new
    # render json:[params]
    @reviews = Review.new
  end

  def create
    # render json:[params]
    @reviews = Review.new rating_params
    @reviews.save
    render :new
  end

  def update
    @reviews = Review.new rating_params
    @reviews.save
    render :new
  end



end
