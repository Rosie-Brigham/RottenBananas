class ReviewsController < ApplicationController
    before_filter :authenticate_user!, except:[:index, :show]
  
  def new
    @review = Review.new
    @review.film = Film.find(params[:film_id])
  end

  def create
    @review = Review.new(review_params)
    if @review.valid?
      @review.save
      redirect_to @review
    else
      render :new
    end
  end

  def show
    @review = Review.find(params[:id])
  end

  def index
    @reviews = Review.all
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to @review
    else
      render 'edit'
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy

    redirect_to @review.film, notice: "That review has been deleted."
  end

  private

  def review_params
    params.require(:review).permit(:film_id, :comment, :number_of_stars, :author)
  end

end
