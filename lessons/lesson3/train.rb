class Train

  attr_reader: number, type, vagons
  
  def initialize number, type, vagons
    @number = number
    @type = type
    @vagons = vagons
    @speed = 0
  end
  
  def speed= speed
    @speed = speed if speed > 0  
  end

  def speed
    @speed
  end  
  
  def stop
    speed = 0
  end
  
  def vagon_attach
    vagons += 1 if speed == 0
  end
  
  def vagon_detach
    vagons -= 1 if speed == 0 && vagons > 0
  end
  
  def route route
    @route = route
    route.firt_station << self
  end
  
  def to_next_station
    station = self.station
    station.send_train if station != nil
  
    next_station = self.next_station
    next_station << train if previous_station != nil
  end
  
  def to_previous_station
    station = self.station
    station.send_train if station != nil
  
    previous_station = self.previous_station
    previous_station << train if previous_station != nil
  end

  def next_station
    stations = @route.stations
    station = stations.select { |station| station.trains.include? self }.first
    station_index = stations.index station
    
    if station_index != null && station_index < stations.size - 1
      stations[station_index + 1]
    else
      nil
    end
  end
  
  def station
    @route.stations.select { |station| station.trains.include? self }.first
  end
    
  def previous_station
    stations = @route.stations
    station = stations.select { |station| station.trains.include? self }.first
    station_index = stations.index station
    
    if station_index != null && station_index > 0
      stations[station_index - 1]
    else
      nil
    end
  end

end
