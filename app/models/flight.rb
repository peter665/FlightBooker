class Flight < ApplicationRecord
  belongs_to :from_airport, class_name: 'Airport', foreign_key: 'start_airport_id'
  belongs_to :to_airport, class_name: 'Airport', foreign_key: 'finish_airport_id'
  has_many :bookings
  has_many :passangers, through: :bookings

  validates :start_airport_id, presence: true
  validates :finish_airport_id, presence: true
  validates :departure, presence: true

  def self.date_list
    dates = Flight.all.order(departure: :asc)
    dates = dates.map do |f|
      f.departure.strftime("%d-%b-%Y")
    end.uniq
  end



end
