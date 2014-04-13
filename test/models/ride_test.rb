require 'test_helper'

class RideTest < ActiveSupport::TestCase
  test "can search by Start_Address" do
    tmpRide = Ride.new
    tmpRide.Start_Address = "1234 1st Ave, Eau Claire, WI, 54703"
    tmpRide.save
    
    searchedRides = Ride.search({:Start_Address => "%Eau Claire%"})
    assert_equal(1, searchedRides.length)
   end
  
  test "can search by End_Address" do
    tmpRide = Ride.new
    tmpRide.End_Address = "1234 1st Ave, Chippewa Falls, WI, 54703"
    tmpRide.save
    
    searchedRides = Ride.search({:End_Address => "%Chippewa Falls%"})
    assert_equal(1, searchedRides.length)
  end
  
  
end
