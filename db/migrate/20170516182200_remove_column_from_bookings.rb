class RemoveColumnFromBookings < ActiveRecord::Migration[5.0]
  def change
    remove_column :bookings, :passanger_id
  end
end
