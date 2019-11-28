class TutorsController < ApplicationController
  before_action :set_tutor, only: %i[show edit update destroy]

  def index
    @bookings = policy_scope(Booking)
    @tutors = Tutor.all
  end

  def show
    authorize Tutor.new
  end

  def new
    authorize Tutor.new
    @tutor = Tutor.new
  end

  def create
    authorize Tutor.new
    tutor = Tutor.new(tutor_params)
    tutor.user = current_user
    spec_array = params['tutor']['specialisation_ids']
    if spec_array.empty? == false
      spec_array.delete_at(0)
      spec_array.each { |id| tutor.specialisations << Specialisation.find(id) }
    end
    if tutor.save
      flash[:notice] = "You created a tutor profile!"
      redirect_to user_path(current_user)
    else
      flash[:alert] = "Please only input valid parameters"
      @tutor = Tutor.new
      render :new
    end
  end

  def edit
    authorize @tutor
  end

  def update
    authorize @tutor
    if @tutor.update(tutor_params)
      spec_array = params['tutor']['specialisation_ids']
      if spec_array.empty? == false
        spec_array.delete_at(0)
        @tutor.specialisations.destroy_all
        spec_array.each { |id| @tutor.specialisations << Specialisation.find(id) }
      end
      @tutor.save
      flash[:notice] = "You have updated your tutor profile!"
      redirect_to user_path(current_user)
    else
      flash[:alert] = "Please only input valid parameters"
      @tutor = Tutor.find(params[:id])
      render :edit
    end
  end

  def destroy
    authorize @tutor
    @tutor.destroy
    redirect_to user_path(current_user)
  end

  private

  def set_tutor
    @tutor = Tutor.find(params[:id])
  end

  def tutor_params
    params.require(:tutor).permit(:age, :gender, :bio, :activity_status, :photo)
  end
end
