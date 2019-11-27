class TutorsController < ApplicationController
  before_action :set_tutor, only: %i[show edit update destroy]

  def index
    @tutors = Tutor.all
  end

  def show
  end

  def new
    @tutor = Tutor.new
  end

  def create
    if Tutor.exists?(user_id: current_user.id)
      flash[:alert] = "You already have a tutor profile!"
      redirect_to tutors_path
    end
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
  end

  def update
    if @tutor.update(tutor_params)
      spec_array = params['tutor']['specialisation_ids']
      if spec_array.empty? == false
        spec_array.delete_at(0)
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
