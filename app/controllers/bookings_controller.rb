class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def show
    if (params[:id] == "new") || (params[:id] == "create")
      @tutor = Tutor.find(params[:tutor_id])
      redirect_to tutor_bookings_path(@tutor)
    else
      @booking = Booking.find(params[:id])
    end
  end

  def new
    @booking = Booking.new
    @tutor = Tutor.find(params[:tutor_id])
    @booking.tutor = @tutor
    @booking.user = current_user
  end

  def create
    a = Booking.new
    a.user = current_user
    a.tutor = Tutor.find(params[:tutor_id])
    if a.update(booking_params)
      redirect_to user_bookings_path(current_user)
    else
      render :new
    end
  end

  def edit
    @booking = Booking.find(params[:id])
    @tutor = @booking.tutor
  end

  def update
    @booking = Booking.find(params[:id])
    if @booking.update(booking_params)
      if @booking.user == current_user
        redirect_to user_bookings_path(current_user)
      else
        redirect_to tutor_bookings_path(current_user.tutor)
      end
    else
      render :edit
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.canceller = current_user.name
    if @booking.cancelled
      @booking.destroy
    else
      @booking.cancelled = true
    end
    @booking.save
    if @booking.user == current_user
      redirect_to user_bookings_path(current_user)
    else
      redirect_to tutor_bookings_path(current_user.tutor)
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:location, :start_datetime, :end_datetime, :comments)
  end
end
