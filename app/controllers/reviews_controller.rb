class ReviewsController < ApplicationController
  before_action :find_review, only: %i[show edit update destroy]

  def new
    @review = Review.new # needed to instantiate the form_for
  end

  def create
    @review = Review.new(review_params)
    @review.save

    redirect_to review_path(@review)
  end

  def show; end

  def destroy
    @review.destroy

    redirect_to reviews_path
  end

  private

  def review_params
    params.require(:review).permit(:title, :content)
  end

  def find_review
    @review = Review.find(params[:id])
  end
end
