require_relative 'train'
require_relative 'cargo_railcar'

class CargoTrain < Train

  def initialize(number) 
    super(number, :cargo)
  end
  
  def railcars_attach(railcars)
    super(railcars) if railcars.class == CargoRailcar
  end
  
  def railcars_detach(railcars)
    super(railcars) if railcars.class == CargoRailcar
  end

end
