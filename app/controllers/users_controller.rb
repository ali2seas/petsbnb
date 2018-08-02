class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  # def edit
  #   @user = User.find(params[:id])
  # end
  # def update
  #   if @user.update(users_params)
  #     redirect_to dashboard_path(@user)
  #   else
  #     render :edit
  #   end
  # end
  # def destroy
  #   @user = User.find(current_user[:id])
  #   @user.destroy
  #   redirect_to roots_path
  # end

  # private
  # def users_params
  #   params.require(:user).permit(:first_name, :last_name, :description, :age, :photo)
  # end
end
