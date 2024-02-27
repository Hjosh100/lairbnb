class LairsController < ApplicationController
  before_action :set_lair, only: [:show, :destroy]
  skip_before_action :authenticate_user!, only: %i[show index]

  def index
    @lairs = policy_scope(Lair)
    # the search query for the search bar
    if params[:query].present?
      @lairs = Lair.search_by_lair(params[:query])
    else
      @lairs = Lair.all
    end
    # The `geocoded` scope filters only lairs with coordinates
    @markers = @lairs.geocoded.map do |lair|
      {
        lat: lair.latitude,
        lng: lair.longitude
      }
    end
    authorize @lairs
  end

  def show
    authorize @lair
    @booking = Booking.new
  end

  def new
    @lair = Lair.new
    authorize @lair
  end

  def create
    @lair = current_user.lairs.build(lair_params)
    authorize @lair
    if @lair.save
      redirect_to lair_path(@lair)
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def destroy
    authorize @lair
    @lair.destroy
    redirect_to root_path, status: :see_other
  end

  private

  def set_lair
    @lair = Lair.find(params[:id])
  end

  def lair_params
    params.require(:lair).permit(:title, :user_id, :category, :location, :price, :description, :latitude, :longitude, photos:[])
  end
end
