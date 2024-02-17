class User < ApplicationRecord
    has_many :lairs
    has_many :bookings
    validates :first_name, presence: :true
    validates :last_name, presence: :true
    validates :password, presence: :true
    validates :email, presence: :true
end
