class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    authorize @user
  end

  def edit
    @user = User.find(params[:id])
    authorize @user
  end

  def update
    @user = User.find(params[:id])
    authorize @user
    if @user.update(users_params)
      redirect_to dashboard_path(@user)
    else
      render :edit
    end
  end

  private

  def users_params
    params.require(:user).permit(:first_name, :last_name, :description, :age, :photo)
  end
end
