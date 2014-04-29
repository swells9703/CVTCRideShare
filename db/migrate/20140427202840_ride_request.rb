class RideRequest < ActiveRecord::Migration
  def change
  
    create_table :request do |t|
      t.integer :Ride_ID
      t.integer :User_ID
      t.boolean :confirmed, default: false
      t.string :token
    end
    
  end
end
