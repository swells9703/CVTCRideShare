class AddSeatPreferencePriceToRides < ActiveRecord::Migration
  def change
    add_column :rides, :seat_count, :integer
    add_column :rides, :seats_booked, :integer
    add_column :rides, :price, :decimal
    add_column :rides, :preferences, :text
  end
end
