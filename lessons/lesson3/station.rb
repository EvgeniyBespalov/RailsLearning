class Station

  attr_reader: name, trains
  
  def initialize (name)
    @name = name
    @trains = []
  end

  def cargo_trains
    trains.each { |train| train if train.type == :cargo }
  end
  
  def passenger_trains
    trains.each { |train| train if train.type == :passenger }
  end
  
  def take_train (train)
    trains << train    
  end

  def send_train (train)
    trains.delete train
  end

end
