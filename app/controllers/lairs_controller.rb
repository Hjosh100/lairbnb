class LairsController < ApplicationController
  before_action :set_lair, only: [:show]
  skip_before_action :authenticate_user!, only: %i[show index]

  def index
    @lairs = Lair.all
  end

  def show
    @booking = Booking.new
  end

  def new
    @lair = Lair.new
  end

  def create
    @lair = current_user.lairs.build(lair_params)
    if @lair.save
      redirect_to lair_path(@lair)
    else
      render 'new', status: :unprocessable_entity
    end
  end

  private

  def set_lair
    @lair = Lair.find(params[:id])
  end

  def lair_params
    params.require(:lair).permit(:title, :category, :location, :price, photos:[])
  end
end
