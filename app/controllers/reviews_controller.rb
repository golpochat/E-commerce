class ReviewsController < ApplicationController

  #Creates the review for the item if the conditions are passed
  def create
    if logged_in?
      @review = Review.new(review_params)
      @review.item_id = params[:item_id]
      if @review.save
      flash[:info] = "Thanks for leaving a review"
      else
      flash[:danger] = "You have already reviewed this book or made too short a comment!"
      end
    redirect_to item_path(@review.item)
    else
    redirect_to item_path(params[:item_id])
    end
  end
  
  #Deletes the review
  def destroy
    @item = Item.find(params[:item_id])
    @review = @item.reviews.find(params[:id])
    @review.destroy
    redirect_to item_path(@item)
  end

  def review_params
    params.require(:review).permit(:author_name, :body,:user_id,:rating)
  end
    
end
