class Lair < ApplicationRecord
  validates :title, presence: true
  validates :category, presence: true, inclusion: { in: %w[island mountain countryside space underground] }
  validates :location, presence: true
  validates :price, presence: true
  has_many_attached :photos
  belongs_to :user
  has_many :bookings
end
