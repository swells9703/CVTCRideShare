class Marker

  def initialize args

    unless args.count.eql?(2)
      raise "Invalid amount of arguments, Expecting: 2, actual: #{args.count}"
    end

    args.each do |k,v|
      instance_variable_set("@#{k}", v) unless v.nil?
    end

  end


end