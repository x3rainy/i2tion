class ReviewsController < ApplicationController
  def new
    @booking = Booking.find(params[:booking_id])
    @review = Review.new(booking: @booking)
    authorize @review
  end

  def create
    @review = Review.new(review_params)
    @booking = Booking.find(params[:booking_id])
    @review.booking = @booking
    @review.user = @booking.user
    @review.tutor = @booking.tutor
    authorize @review
    if @review.save
      flash[:notice] = "Review Created!"
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def edit
    @review = Review.find(params[:id])
    @booking = @review.booking
    authorize @review
  end

  def update
    @review = Review.find(params[:id])
    @booking = @review.booking
    authorize @review
    if @review.update(review_params)
      flash[:notice] = "Review Updated!"
      redirect_to booking_path(@booking)
    else
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])
    authorize @review
    @booking = @review.booking
    @review.destroy
    flash[:notice] = "Review Deleted!"
    redirect_to booking_path(@booking)
  end

  private

  def review_params
    params.require(:review).permit(:content, :stars)
  end
end
