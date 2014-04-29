require 'test_helper'

class RideTest < ActiveSupport::TestCase
  test "can search by Start_Address" do
    tmpRide = Ride.new
    tmpRide.id = 10
    tmpRide.Start_Address = "1234 1st Ave, Eau Claire, WI, 54703"
    tmpRide.End_Address = "1234 1st Ave, Chippewa Falls, WI, 54703"
    tmpRide.Time = "2014-5-4"
    tmpRide.save
    
    searchedRides = Ride.search({:Start_Address => "Eau Claire"})
    assert_equal(1, searchedRides.length)
   end
  
  test "can search by End_Address" do
    tmpRide = Ride.new
    tmpRide.id = 10
    tmpRide.Start_Address = "1234 1st Ave, Eau Claire, WI, 54703"
    tmpRide.End_Address = "1234 1st Ave, Chippewa Falls, WI, 54703"
    tmpRide.Time = "2014-5-4"
    tmpRide.save
    
    searchedRides = Ride.search({:End_Address => "Chippewa Falls"})
    assert_equal(1, searchedRides.length)
  end
  
  test "can search by Time" do
    tmpRide = Ride.new
    tmpRide.id = 10
    tmpRide.Start_Address = "1234 1st Ave, Eau Claire, WI, 54703"
    tmpRide.End_Address = "1234 1st Ave, Chippewa Falls, WI, 54703"
    tmpRide.Time = "2014-5-4"
    tmpRide.save
    
    searchedRides = Ride.search({:Time => {"year" => "2014", "month" => "05", "day" => "04"}})
    assert_equal(1, searchedRides.length)
  end
  
  test "gets correct geolocation" do
    tmpRide = Ride.new
    #44.5677422, -91.6709927
    tmpRide.Start_Address = "Mondovi, WI"
    #44.811349,-91.4984941
    tmpRide.End_Address = "Eau Claire, WI"
    
    locArray = tmpRide.getStartEndCoordinates
    
    #start address
    assert_equal(44.5677422,locArray[0][0]) #longitude
    assert_equal(-91.6709927,locArray[0][1]) #latitude
    
    #end address
    assert_equal(44.811349,locArray[1][0]) #longitude
    assert_equal(-91.4984941,locArray[1][1]) #latitude    
    
    
  end 

  
end
