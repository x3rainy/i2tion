class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @tutor = @user.tutor
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
    if (params[:user][:name] == "" || params[:user][:phone_number] == "") && current_user.tutor
      flash[:alert] = "Your name and phone number cannot be blank since you have a tutor profile!"
    else
      @user.update(user_params)
      flash[:notice] = "User profile updated!"
    end
    redirect_to user_path(current_user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :preference, :phone_number)
  end
end
