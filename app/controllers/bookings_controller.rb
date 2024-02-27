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
    @booking.accepted == false ? @booking.update(accepted: true) : @booking.update(accepted: false)
    # redirect_to lair_booking_path(@booking)
    redirect_to renter_index_user_bookings_path(current_user), status: :see_other
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

  def accept_params
    params.require(:booking).permit(:accept)
  end

  def booking_params
    params.require(:booking).permit(:lair_id, :start_date, :end_date)
  end
end
