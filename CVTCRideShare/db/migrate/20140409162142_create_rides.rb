class CreateRides < ActiveRecord::Migration
  def change
    #rides table 04/09/14
    create_table :rides do |t|
      t.integer :Driver_ID
      t.string :Start_Address
      t.string :End_Address
      t.datetime :Time

      #t.timestamps
    end

  end
end
