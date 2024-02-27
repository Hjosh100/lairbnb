class BookingsController < ApplicationController
  before_action :set_booking, only: %i[show confirm destroy]
  before_action :set_lair, only: %i[new create]
  before_action :set_booking_all, only: %i[index renter_index]

  def index
    @bookings = policy_scope(Booking)

  end

  def renter_index
    authorize @bookings
    @bookings_for_user_lairs = Booking.joins(:lair).where(lairs: { user_id: current_user.id })
  end

  def show
    authorize @booking
  end

  def new
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.lair = @lair
    @booking.user = current_user
    authorize @booking
    if @booking.save!
      redirect_to lair_booking_path(@lair, @booking)
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def confirm
    authorize @booking
    @booking.lair = @lair
    @booking.accepted == false ? @booking.update(accepted: true) : @booking.update(accepted: false)
    # redirect_to lair_booking_path(@booking)
    redirect_to renter_index_user_bookings_path(current_user), status: :see_other
  end

  def destroy
    authorize @booking
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
