class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def show
    if (params[:id]) == "new" || (params[:id]) == "create"
      @tutor = Tutor.find(params[:tutor_id])
      redirect_to tutor_bookings_path(@tutor)
    else
      @booking = Booking.find(params[:id])
    end
  end

  def new
    @booking = Booking.new
    # if (params[:user_id]) != nil
    #   @user = User.find(params[:user_id])
    #   @booking.user = @user
    # end_datetime
    # if (params[:tutor_id]) != nil
    @tutor = Tutor.find(params[:tutor_id])
    @booking.tutor = @tutor
    @booking.user = current_user
    # end
  end

  def create
    a = Booking.new()
    a.user = current_user
    a.tutor = Tutor.find(params[:tutor_id])
    if a.update(booking_params)
      redirect_to tutor_bookings_path(a.tutor)
    else
      render :new
    end
    # a.location = params[:booking]["location"]
    # a.comments = params[:booking]["comments"]
    # a.start_datetime = params[:booking]["start_datetime"]
    # a.end_datetime = params[:booking]["end_datetime"]
  end

  def edit
    @booking = Booking.find(params[:id])
    @tutor = @booking.tutor
  end

  def update
    @booking = Booking.find(params[:id])
    if @booking.update(booking_params)
      redirect_to tutor_bookings_path(@booking.tutor)
    else
      render :edit
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to tutor_bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:location, :start_datetime, :end_datetime, :comments)
  end
end
