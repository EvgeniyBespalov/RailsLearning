class Train

  attr_reader: number, type, vagons, speed
  
  def initialize(number, type, vagons)
    @number = number
    @type = type
    @vagons = vagons
    @speed = 0
  end
  
  def increase_speed(speed)
    @speed = speed if speed > @speed  
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
  
  def take_route(route)
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
    station_index = stations.index station
     
    stations[station_index + 1] if station_index != null && station_index < stations.size - 1
  end
  
  def station
    @route.stations.find { |station| station.trains.include? self }
  end
    
  def previous_station
    stations = @route.stations
    station_index = stations.index station
      
    stations[station_index - 1] if station_index != null && station_index > 0
  end

end
