class ReviewsController < ApplicationController
  before_action :find_review, only: %i[show]

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new # needed to instantiate the form_for
  end

  def create
    @review = Review.new(review_params)
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def show; end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end

  def find_review
    @review = Review.find(params[:id])
  end
end
