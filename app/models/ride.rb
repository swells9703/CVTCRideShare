class Ride < ActiveRecord::Base

  def self.getGeoRideData

    rideGeoLoc = Array.new

    self.all.each do |r|
      coords = Geocoder.coordinates(r.address)
      rideGeoLoc.push([r.location, coords[0], coords[1]])
    end

    rideGeoLoc

  end

end
