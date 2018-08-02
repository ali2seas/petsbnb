class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @pets = Pet.first(3)
  end


end
