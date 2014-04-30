class RideController < ApplicationController
   before_filter :authenticate_user!, :only => [:show]
  
  def index
    @ride = Ride.all
  end

  def show
    @ride = Ride.find(params[:id])
    @markers = @ride.getStartEndCoordinates
  end

  def search
    
  end
  
  def results
    @ride = Ride.search params
  end

  def new
    @ride = Ride.new  
  end
  
  def edit
    @ride = Ride.find(params[:id])
    if can? :edit, @ride && current_user == @ride.Driver_ID
      #count the amount of seats taken to set the lowest amount the user can set
      #this will be done when the requests table is made
      @minSeats = 0
      @maxSeats = @minSeats + 10
    else
      flash[:notice] = 'You do not have permissions to edit this ride.'
      redirect_to :action => 'show', :id => @ride
    end
  end
  
  def update
    @ride = Ride.find(params[:id])
    if @ride.update_attributes(ride_params)
      flash[:notice] = 'Ride was successfully updated.'
      redirect_to @ride
    else
      render :action => 'edit'
    end 
  end
  
  def create
    @ride = Ride.new(ride_params)
    @ride.Driver_ID = current_user
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
    params.require(:ride).permit(:Driver_ID, :Start_Address, :End_Address, :seat_count, :seats_booked, :price, :preferences, :Time)
  end

end
