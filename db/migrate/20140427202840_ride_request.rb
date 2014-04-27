class RideRequest < ActiveRecord::Migration
  def change
  
    create_table :request do |t|
      t.integer :Unique_Identifier
      t.integer :Ride_ID
      t.integer :Requester_ID
      t.string :confirmed, :boolean, default: false
    end
    
  end
end
