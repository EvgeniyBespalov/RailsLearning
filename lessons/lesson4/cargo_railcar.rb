resource_relative 'railcar' 

class CargoRailcar < Railcar

  attr_reader: loading_capacity

  def initialize(loading_capacity)
    @loading_capacity = loading_capacity
  end
  
  private
  
  attr_writer: loading_capacity

end
