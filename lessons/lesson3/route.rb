class Route

  attr_reader: first_station, last_staton, way_stations

  def initialize (first_station, last_staton)
    @first_station = first_station
    @last_staton = last_station
    @way_stations = []
  end
  
  def way_stations<< (station)
    @way_stations << station
  end
  
  def remove_way_station (station)
    @way_stations.delete station
  end
  
  def stations
    [@first_station] + @way_stations + [@last_staton]
  end
    
end
