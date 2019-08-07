require_relative 'train' 
require_relative 'passenger_railcar'

class PassengerTrain < Train

  def initialize(number) 
    super(number, :passenger)
  end
  
  def railcars_attach(railcars)
    super(railcars) if railcars.class == PassengerRailcar
  end
  
  def railcars_detach(railcars)
    super(railcars) if railcars.class == PassengerRailcar
  end
  
end
