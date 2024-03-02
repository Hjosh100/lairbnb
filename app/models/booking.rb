class Booking < ApplicationRecord
  validates :start_date, presence: true
  validates :end_date, presence: true
  # attr_accessor :accepted

  belongs_to :user
  belongs_to :lair

  def self.future
    where('start_date > ?', Date.today)
  end

  def self.past
    where('end_date < ?', Date.today)
  end

  scope :current, -> { where('start_date <= ? AND end_date >= ?', Date.today, Date.today) }

end
