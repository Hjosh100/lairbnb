class Lair < ApplicationRecord
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_address?

  validates :title, presence: true
  validates :category, presence: true, inclusion: { in: %w[island mountain countryside space underground] }
  validates :location, presence: true
  validates :price, presence: true

  validates :description, presence: true
  has_many_attached :photos
  belongs_to :user
  has_many :bookings
  has_many :users, through: :bookings
end
