class AddColsToPassangerBookings < ActiveRecord::Migration[5.0]
  def change
    add_column :passanger_bookings, :passanger_id, :integer
    add_column :passanger_bookings, :booking_id, :integer
  end
end
