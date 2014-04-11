require 'test_helper'

class RideTest < ActiveSupport::TestCase
  test "can search by :Start_Address" do
    tmpRide = Ride.new
    tmpRide.Start_Address = "1234 1st Ave, Eau Claire, WI, 54703"
    
    searchedRides = Ride.search(:Start_Address => "Eau Claire")
   end
  
end
