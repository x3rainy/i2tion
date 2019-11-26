class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  # def new
  #   @user = User.new
  # end

  # def create
  #   @user = User.new(user_params)
  #   if @user.save
  #     redirect_to user_path
  #   else
  #     render :new
  #   end
  # end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.name = params[:user][:name]
    @user.preference = params[:user][:preference]
    @user.phone_number = params[:user][:phone_number]
    if @user.save
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private

  def user_params
    params.permit(:user).require(:name, :preference, :phone_number)
  end
end
