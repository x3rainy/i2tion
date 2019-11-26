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
    else
      tutor = Tutor.new(tutor_params)
      tutor.user = current_user
      tutor.save

      params['tutor']['specialisation_ids'].delete('')
      params['tutor']['specialisation_ids'].each do |spe_id|
        ts = TutorSpecialisation.new
        ts.specialisation = Specialisation.find(spe_id)
        ts.tutor = tutor

        ts.save
      end
      flash[:notice] = "You created a tutor profile!"
      redirect_to user_path(current_user)
    end
  end

  def edit
  end

  def update
    @tutor.update(tutor_params)
    params['tutor']['specialisation_ids'].delete('')
    unless @tutor.specialisation_ids == params['tutor']['specialisation_ids'].map(&:to_i)
      @tutor.specialisations.destroy_all

      params['tutor']['specialisation_ids'].each do |spe_id|
        ts = TutorSpecialisation.new
        ts.specialisation = Specialisation.find(spe_id)
        ts.tutor = @tutor

        ts.save
      end
    end
    flash[:notice] = "Tutor profile updated!"
    redirect_to user_path(current_user)
  end

  def destroy
    @tutor.destroy
    redirect_to tutors_path
  end

  private

  def set_tutor
    @tutor = Tutor.find(params[:id])
  end

  def tutor_params
    params.require(:tutor).permit(:age, :gender, :bio, :activity_status, :photo)
  end
end
