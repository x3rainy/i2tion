class BookingsController < ApplicationController
  def index
    if params[:tutor_id].nil?
      @user = User.find(params[:user_id])
      @bookings = policy_scope(Booking)
      @bookings = @bookings.where(user: @user)
      authorize Booking.new(user: @user)
    else
      @tutor = Tutor.find(params[:tutor_id])
      @bookings = policy_scope(Booking)
      @bookings = @bookings.where(tutor: @tutor)
      authorize Booking.new(tutor: @tutor)
    end
  end

  def show
    # if (params[:id]) == "new" || (params[:id]) == "create"
    #   @tutor = Tutor.find(params[:tutor_id])
    #   redirect_to tutor_bookings_path(@tutor)
    # else
      @booking = Booking.find(params[:id])
      authorize @booking
    # end
  end

  def new
    authorize Booking.new(tutor: Tutor.find(params[:tutor_id]))
    @booking = Booking.new
    @tutor = Tutor.find(params[:tutor_id])
    @booking.tutor = @tutor
    @booking.user = current_user
  end

  def create
    authorize Booking.new(tutor: Tutor.find(params[:tutor_id]))
    a = Booking.new()
    a.user = current_user
    a.tutor = Tutor.find(params[:tutor_id])
    if a.update(booking_params)
      flash[:notice] = "Booking Created!"
      redirect_to user_bookings_path(current_user)
    else
      render :new
    end
  end

  def edit
    @booking = Booking.find(params[:id])
    authorize @booking
    @tutor = @booking.tutor
  end

  def update
    @booking = Booking.find(params[:id])
    authorize @booking
    if @booking.update(booking_params)
      flash[:notice] = "Booking Updated!"
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
    authorize @booking
    # @booking.review.destroy if @booking.review != nil WE ARE NO LONGER DESTROYING REVIEWS
    @booking.destroy
    flash[:notice] = "Booking Deleted!"
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
