class Lair < ApplicationRecord
  validates :title, presence: true
  validates :category, precence: true, inclusion: { in: %w[island mountain countryside space underground] }
  validates :location, presence: true
  validates :price, presence: true
  belongs_to :user
end
