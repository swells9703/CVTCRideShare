class RideController < ApplicationController
  def index
    
  end

  def search

  end

  def new
    @ride = Ride.new  
  end

  def create
    @ride = Ride.new(params[:ride]) 
    if @ride.save 
      redirect_to @ride
    else
      render "new"
    end
  end

end
