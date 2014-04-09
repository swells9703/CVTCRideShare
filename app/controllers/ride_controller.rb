class RideController < ApplicationController
  def index
    
  end

  def search

  end

  def new
    @ride = Ride.new  
  end

  def create
    @ride = Ride.new(ride_params)
    if @ride.save 
      redirect_to @ride
    else
      render "new"
    end
  end

  private

  #rails 4 way to do things
  def ride_params
    params.permit(:Driver_ID, :Start_Address, :End_Address, :Time)
  end

end
