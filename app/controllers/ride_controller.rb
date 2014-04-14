class RideController < ApplicationController

  def index
    @ride = Ride.all
  end

  def show
    @ride = Ride.find(params[:id])
  end

  def search
    @ride = Ride.search params[:search]
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
    params.require(:ride).permit(:Driver_ID, :Start_Address, :End_Address, :Time)
  end

end
