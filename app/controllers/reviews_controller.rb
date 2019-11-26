class ReviewsController < ApplicationController
  def new
    @booking = Booking.find(params[:booking_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @booking = Booking.find(params[:booking_id])
    @review.booking = @booking
    if @review.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def edit
    @review = Review.find(params[:id])
    @booking = @review.booking
  end

  def update
    @review = Review.find(params[:id])
    @booking = @review.booking
    if @review.update(review_params)
      redirect_to booking_path(@booking)
    else
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @booking = @review.booking
    @review.destroy
    redirect_to booking_path(@booking)
  end

  private

  def review_params
    params.require(:review).permit(:content, :stars)
  end
end
