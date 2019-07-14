resource_relative 'train' 

class CargoTrain < Train

  attr_reader: railcars
  
  def initialize(number) 
    super(number, :cargo)
  end
  
end
