class IndexController < ApplicationController
  def index
    #Geocoder::Calculations.distance_between([47.858205,2.294359], [40.748433,-73.985655])
    #Geocoder.coordinates("25 Main St, Cooperstown, NY")

    @markers = Ride.getGeoRideData
    @infoWindowContent = []
  end
end
