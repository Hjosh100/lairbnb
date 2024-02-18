class BookingsController < ApplicationController
  before_action :set_booking, only: %i[show edit update destroy]
  before_action :set_lair, only: %i[show new create]

  def show
  end

  def new
    @lair = Lair.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.lair = @lair
    if @booking.save
      redirect_to lair_path(@lair)
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @booking.destroy
    redirect_to lair_path(@booking)
  end

  private

  def set_booking
    @booking = Booking.find(:id)
  end

  def set_lair
    @lair = Lair.find(params(:lair_id))
  end

  def booking_params
    params.require(:booking).permit(:lair_id, :date)
  end
end
