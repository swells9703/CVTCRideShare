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
    @ride = Ride.new(ride_params)
    respond_to do |format|
      if @ride.save
        format.html { redirect_to @ride, notice: 'New ride was successfully created.'}
        format.json { render action:'new', status: created, location: @ride}
      else
        format.html { render action: 'new' }
        format.json { render json: @ride.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  #rails 4 way to do things
  def ride_params
    params.require(:ride).permit(:Driver_ID, :Start_Address, :End_Address, :seat_count, :price, :preferences, :Time)
  end

end
