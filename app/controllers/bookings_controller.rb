class BookingsController < ApplicationController
  before_action :set_booking, only: %i[show confirm destroy]
  before_action :set_lair, only: %i[index new create]
  before_action :set_booking_all, only: %i[index renter_index]

  def index
  end

  def renter_index
    @user = User.find(params[:id])
    raise
  end

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

  def confirm
    @booking.lair = @lair
    @booking.update_attibute(accepted: true)
    redirect_to lair_path(@lair)
  end

  def destroy
    @booking.destroy
    redirect_to lair_path(@booking.lair), status: :see_other
  end

  private

  def set_booking
    @booking = Booking.find(:id)
  end

  def set_lair
    @lair = Lair.find(params[:lair_id])
  end

  def set_booking_all
    @bookings = Booking.all
  end

  def booking_params
    params.require(:booking).permit(:lair_id, :date)
  end
end
