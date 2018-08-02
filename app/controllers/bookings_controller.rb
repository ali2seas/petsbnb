class BookingsController < ApplicationController

  def index
    @booking = policy_scope(Booking)
  end
  
  def new
    @booking = Booking.new
  end
  
  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.pet= Pet.find(params[:pet_id])
    if @booking.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    authorize @booking
    if @booking.update(booking_params)
      redirect_to dashboard_path
    else
      render :edit
    end
  end

  private
  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
  
end
