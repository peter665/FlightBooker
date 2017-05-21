class Booking < ApplicationRecord
  belongs_to :flight
  has_many :passangers, through: :passanger_bookings
  has_many :passanger_bookings

  accepts_nested_attributes_for :passangers

  validates :flight_id, presence: true
end
