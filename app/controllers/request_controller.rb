class RequestController < ApplicationController
  
  #cannot be used due to a nonworking book method 
  def accept
    @request = Request.find_by_token(params[:token])  
    @ride    = Request.ride
    
    #mark the request as confirmed and update the database
    @request.confirmed = true
    @ride.seats_booked += 1
    @request.save
    @ride.save
    
  end
  
end
