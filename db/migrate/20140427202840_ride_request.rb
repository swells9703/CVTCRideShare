class RideRequest < ActiveRecord::Migration
  def change
  
    create_table :request do |t|
      t.integer :ride_id
      t.integer :user_id
      t.boolean :confirmed, default: false
      t.string :token
    end
    
  end
end
