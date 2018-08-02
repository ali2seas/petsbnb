class PetsController < ApplicationController
 skip_before_action :authenticate_user!, only: [:index, :show]

 authorize @pet

 def index
   @pets = Pet.all
 end

 def show
   @pet = Pet.find(params[:id])
 end

 def new
   @pet = Pet.new
 end

 def create
  @pet = Pet.new(pet_params)
  @pet.user = current_user
  if @pet.save
    redirect_to dashboard_path
  else
    render :new
  end
 end

 def edit
   @pet = Pet.find(params[:id])
 end

 def update
  @pet = Pet.find(params[:id])
  if @pet.update(pet_params)
    redirect_to dashboard_path
  else
    render :edit
  end
 end

  def destroy
    @pet = Pet.find(params[:id])
    @pet.destroy
  end

  private
  def pet_params
    params.require(:pet).permit(:start_date, :end_date)
  end
end