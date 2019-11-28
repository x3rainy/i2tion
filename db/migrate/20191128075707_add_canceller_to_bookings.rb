class AddCancellerToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :canceller, :string
  end
end
