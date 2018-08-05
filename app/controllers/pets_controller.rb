class PetsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @pets = policy_scope(Pet)
    @pets = Pet.where.not(latitude: nil, longitude: nil)

    @markers = @pets.map do |pet|
      {
        lat: pet.latitude,
        lng: pet.longitude#,
        # infoWindow: { content: render_to_string(partial: "/flats/map_box", locals: { flat: flat }) }
      }
    end
  end

  def show
    @pet = Pet.find(params[:id])
    authorize @pet
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
    authorize @pet
    if @pet.update(pet_params)
      redirect_to dashboard_path
    else
      render :edit
    end
  end

  def destroy
    @pet = Pet.find(params[:id])
    authorize @pet
    @pet.destroy
    redirect_to dashboard_path
  end

 private
 def pet_params
   params.require(:pet).permit(:name, :address, :age, :category, :size, :photo)
 end


end
