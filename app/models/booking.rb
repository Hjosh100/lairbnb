class Booking < ApplicationRecord
  validates :date, presence: true
  attr_accessible :accepted
  belongs_to :user
  belongs_to :lair

  after_create
end
