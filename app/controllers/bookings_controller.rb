class BookingsController < ApplicationController
  before_action :set_booking, only: %i[show confirm destroy]
  before_action :set_lair, only: %i[new create]
  before_action :set_booking_all, only: %i[index renter_index]

  def index
  end

  def renter_index
  end

  def show
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.lair = @lair
    @booking.user = current_user
    if @booking.save!
      redirect_to lair_booking_path(@lair, @booking)
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def confirm
    @booking.lair = @lair
    @booking.update_attribute(accepted: true)
    redirect_to lair_path(@lair), status: :see_other
  end

  def destroy
    @booking.destroy
    redirect_to lair_path(@booking.lair), status: :see_other
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_lair
    @lair = Lair.find(params[:lair_id])
  end

  def set_booking_all
    @bookings = Booking.all
  end

  def booking_params
    params.require(:booking).permit(:lair_id, :start_date, :end_date, :accepted)
  end
end
