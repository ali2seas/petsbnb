class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :contact, :faq, :about]

  def home
    @pets = Pet.first(3)
  end

  def dashboard
  end

  def contact
  end

  def faq
  end

  def about
  end
end
