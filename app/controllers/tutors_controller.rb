class TutorsController < ApplicationController
  before_action :set_tutor, only: %i[show edit update destroy]

  def index
    @tutors = Tutor.all
  end

  def show
    # @tutor_specialisation = TutorSpecialisation.new
  end

  def new
    @tutor = Tutor.new
  end

  def create
    @tutor = Tutor.new(tutor_params)
    if @tutor.save!
      redirect_to tutors_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    redirect_to tutor_path(@tutor) if @tutor.update(tutor_params)
  end

  def destroy
    @tutor.destroy
    redirect_to root_path
  end

  private

  def set_tutor
    @tutor = Tutor.find(params[:id])
  end

  def tutor_params
    params.require(:tutor).permit(:age, :gender, :bio, :activity_status)
  end
end
