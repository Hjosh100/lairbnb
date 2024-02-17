class Lair < ApplicationRecord
  validates :title, presence: true
  validates :category, precence: true, inclusion: { in: %w[island mountain countryside space underground] }
  validates :location, presence: true
  validates :price, presence: true
  has_one_attached :photo
  belongs_to :user
  has_many :bookings
end
