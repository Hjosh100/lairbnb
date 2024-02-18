class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.boolean :accepted, default: false
      t.date :date
      t.references :user, null: false, foreign_key: true
      t.references :lair, null: false, foreign_key: true

      t.timestamps
    end
  end
end
