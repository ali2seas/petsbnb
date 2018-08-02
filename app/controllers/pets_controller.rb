class PetsController < ApplicationController
    def index
      @pets = Pet.all
    end

    def show
      @pet = Pet.find(params[:id])
    end

    def new
      @pet = Pet.new
    end

    def create        # POST /restaurants
    end

    def edit
      @pet = Pet.find(params[:id])
    end

    def update        # PATCH /restaurants/:id
    end

    def destroy       # DELETE /restaurants/:id
    end
end
