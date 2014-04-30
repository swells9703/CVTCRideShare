class RideRequestMailer < ActionMailer::Base
  
  default from: "noreply@cvtcrideshare.com"
  
  #req field for mailer setup:
  #table ride_requests
  #id      :int, unique ride_request id
  #ride_id :int, the rides id in the ride table
  #user_id :int, requestors id
  #RideRequestMailer.ride_request(ride_id).deliver
  def ride_request(ride_id, current_user_id)
    #we have no relationships set up..
    @ride       = Ride.find(ride_id)
    @ride_owner = User.find(@ride.Driver_ID)
    @req_user   = User.find(current_user_id)
    @token      = Digest::SHA1.hexdigest(@ride.Start_Address + @ride.End_Address+ @req_user.id.to_s)
    
    #change to first name or something in the future
    mail(to: @ride_owner.email, subject: "Ride request from #{@req_user.email}")
  
  end
  
  def confirm_request
    @request = Request.find(params[:id])
    #establish relationships before using!
    @ride    = Request.ride
    mail(to: @request.user.email, subject: "Request to <?= @ride.Start_Address ?> Accepted")
  end
  
end
