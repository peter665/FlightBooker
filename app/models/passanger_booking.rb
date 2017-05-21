class PassangerBooking < ApplicationRecord
  belongs_to :booking
  belongs_to :passanger
end
