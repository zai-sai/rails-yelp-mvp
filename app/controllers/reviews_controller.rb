class ReviewsController < ApplicationController
  # def new
  #   @review = Review.new
  #   @restaurant = Restaurant.find(params[:restaurant_id])
  #   @rating = (0..5)
  # end

  def create
    @review = Review.new(review_params)
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      @reviews = Review.where(restaurant_id: params[:restaurant_id])
      render 'restaurants/show', status: :unprocessable_content
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
