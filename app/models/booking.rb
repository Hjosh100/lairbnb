class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :lair
end
