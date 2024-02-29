module BookingsHelper
  def number_of_nights(start_date, end_date)
    nights = (end_date - start_date).to_i + 1
    nights > 0 ? nights : 1
  end
end
