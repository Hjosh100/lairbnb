class Booking < ApplicationRecord
  validates :start_date, presence: true
  validates :end_date, presence: true
  # attr_accessor :accepted

  belongs_to :user
  belongs_to :lair

  # def initialize(accepted)
  #   @accepted = accepted
  # end
end
