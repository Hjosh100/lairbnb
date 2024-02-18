class RemoveAcceptedFromBookings < ActiveRecord::Migration[7.1]
  def change
    remove_column :bookings, :accepted, :boolean
  end
end
