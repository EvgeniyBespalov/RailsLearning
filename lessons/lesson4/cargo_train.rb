require_relative 'train' 

class CargoTrain < Train

  def initialize(number) 
    super(number, :cargo)
  end
  
  def railcars_attach(railcars)
    super(railcars)
  end
  
  def railcars_detach(railcars)
    super(railcars)
  end
end
