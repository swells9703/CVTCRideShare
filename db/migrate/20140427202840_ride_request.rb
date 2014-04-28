class RideRequest < ActiveRecord::Migration
  def change
  
    create_table :request do |t|
      t.integer :Unique_Identifier
      t.integer :Ride_ID
      t.integer :Requester_ID
      t.boolean :confirmed, default: false
      t.string :preferences
      t.string :token
    end
    
  end
end
