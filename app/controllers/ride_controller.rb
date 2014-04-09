class RideController < ApplicationController
  def index
    
  end

  def search

  end

  #TODO notify on view if save fail 
  def new
    @ride = Ride.new(params[:ride]) 
    if @ride.save 
      redirect_to @ride
    else
      render "new"
  end

end
