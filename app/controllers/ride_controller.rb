class RideController < ApplicationController

  def index
    @ride = Ride.all
  end

  def show
    @ride = Ride.find(params[:id])
  end

  def search
    
  end
  
  def results
    @ride = Ride.search params
  end

  def new
    @ride = Ride.new  
  end

  def create
    flash[:notice] = "The new ride was successfully created."
    @created = Ride.new(ride_params)
    @created.save
    @ride = Ride.new
    render "new"    
  end

  private

  #rails 4 way to do things
  def ride_params
    params.require(:ride).permit(:Driver_ID, :Start_Address, :End_Address, :Time)
  end

end
