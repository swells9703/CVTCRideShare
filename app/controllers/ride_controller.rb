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
    @created = Ride.new(ride_params)
    @created.save
    @ride = Ride.new
    render "new"    
    
  def cancle
    Ride.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
  end

  private

  #rails 4 way to do things
  def ride_params
    params.require(:ride).permit(:Driver_ID, :Start_Address, :End_Address, :Time)
  end

end
