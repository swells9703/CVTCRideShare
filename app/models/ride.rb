class Ride < ActiveRecord::Base
  validates_presence_of :Start_Address, :End_Address, :Time

  
  def self.search(args)
    logger.debug Date.parse(args[:Time].map{|k,v| v }.join("-"))
    tmpRides = Ride.all
    args[:Time].delete_if {|k,v| not v.present? } if args[:Time].present?
    tmpRides = tmpRides.where("Start_Address like ?", "%" + args[:Start_Address] + "%") if args[:Start_Address].present?
    tmpRides = tmpRides.where("End_Address like ?", "%" + args[:End_Address] + "%") if args[:End_Address].present?
    tmpRides = tmpRides.where("Date(Time) = Date(?)", Date.parse(args[:Time].map{|k,v| v }.join("-"))) if args[:Time].present?
    return tmpRides
    
  end

end