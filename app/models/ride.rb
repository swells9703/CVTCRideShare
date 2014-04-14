class Ride < ActiveRecord::Base

  def self.getGeoRideData

    rideGeoLoc = Array.new

    self.all.each do |r|
      coords = Geocoder.coordinates(r.address)
      rideGeoLoc.push([r.location, coords[0], coords[1]])
    end

    rideGeoLoc

  end
  
  def self.search(args)
    tmpRides = Ride.all
    tmpRides = tmpRides.where("Start_Address like :Start_Address", args) if args.has_key?(:Start_Address)
    tmpRides = tmpRides.where("End_Address like :End_Address", args) if args.has_key?(:End_Address)
    tmpRides = tmpRides.where("Date(Time) = Date(:Time)", args) if args.has_key?(:Time)
    return tmpRides
    
  end

end
