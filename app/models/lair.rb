class Lair < ApplicationRecord
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?


  include PgSearch::Model
  pg_search_scope :global_search,
  against: [ :title, :category, :location, :description],
  associated_against: {
    user: [ :first_name, :last_name ]
  },
  using: {
    tsearch: { prefix: true } # <-- now `superman batm` will return something!
  }

  validates :title, presence: true
  validates :category, presence: true, inclusion: { in: %w[island mountain countryside space underground] }
  validates :location, presence: true
  validates :price, presence: true

  validates :description, presence: true
  has_many_attached :photos
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings
end
