if @booking.persisted?
  json.form render(partial: "bookings/form", formats: :html)
end
