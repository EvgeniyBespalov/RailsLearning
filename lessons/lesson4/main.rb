require_relative 'station'
require_relative 'route'
require_relative 'cargo_train'
require_relative 'passenger_train'
require_relative 'cargo_railcar'
require_relative 'passenger_railcar'

class Main

  def initialize
    @stations = []
    @trains = []
    @routes = []
  end

  def initialize(stations, trains, routes)
    @stations = stations
    @trains = trains
    @routes = routes
  end

  def start
    loop do
      case main_menu
        when 0
          exit
        when 1
          station_processing
        when 2
          train_processing
        when 3
          route_processing
      end
    end
  end

  private  

  attr_accessor :stations, :trains, :routes  
  
  def station_processing
    loop do
      case station_main_menu
        when 0
          return
        when 1
          stations_print
        when 2
          station_create
        when 3
          get_trains_on_station
        when 4
          send_train
      end
    end
  end

  def stations_print
    puts "Список станций пуст" if @stations.size == 0
    @stations.each_with_index { |station, index| puts "#{index + 1} - #{station.name}" }
  end  
  
  def select_station
    stations_print
    return if @stations.size == 0
    puts "Введите порядковый номер станции"
    station_number = gets.chomp.to_i
    station = @stations[station_number - 1]
    unless station then
      puts "Станция не найдена"
      return
    end
    station
  end
  
  def select_train
    trains = get_trains_on_station
    return unless trains
    return if trains.size == 0
    
    puts "Введите номер поезда"
    train_number = gets.chomp.to_s
    train = trains.find { |train| train.number == train_number }
    unless train then
      puts "Поезд не найден"
      return
    end
    train
  end  
  
  def station_create
    puts "Введите порядковый номер станции"
    station_name = gets.chomp.to_s
    @stations << Station.new(station_name) unless @stations.find { |station| station.name == station_name }
  end
  
  def get_trains_on_station
    station = select_station
    return unless station
    station.trains.each { |t| puts "#{t.number}" }
    puts "Поезда на станции отсутствуют" if station.trains.size == 0
    station.trains
  end
  
  def send_train
    train = select_train
    return unless train
    
    case train_send_menu
      when 0
        return
      when 1
        train.to_previous_station
      when 2
        train.to_next_station
    end
  end  
  
  def train_processing
    loop do
      case train_main_menu
        when 0
          return
        when 1
          trains_print
        when 2
          train_create
        when 3
          train_take_route
        when 4
          train_attach_railcar
        when 5
          train_detach_railcar
      end
    end
  end

  def trains_print
    puts "Список поездов пуст" if @trains.size == 0
    @trains.each_with_index { |train, index| puts "#{index + 1} - #{train.number}" }
  end  
  
  def train_create
    train_type = train_create_menu
    return unless train_type
    
    puts "Введите номер поезда"
    train_number = gets.chomp.to_s
    return if @trains.find { |train| train.number == train_number }
    
    if train_number == 1 then
      @trains << PassengerTrain.new(train_number)
    end
    
    if train_number == 2 then
      @trains << CargoTrain.new(train_number)
    end
  end
  
  def train_take_route
    if (@routes.size == 0) then
      puts "Список маршрутов пуст, продолжение невозможно."
      return
    end
    if (@trains.size == 0) then
      puts "Список поездов пуст, продолжение невозможно."
      return
    end
    
    train = select_train
    return unless train
    
    route = select_route
    return unless route
    
    train.take_route(route)    
  end
  
  def train_attach_railcar
    train = select_train
    return unless train
    
    if train.type == :cargo then
      puts "Введите грузоподъемность"
      loading_capacity = gets.chomp.to_i
      return unless loading_capacity
      
      train.railcars_attach(CargoRailcar.new(loading_capacity))
    end
    
    if train.type == :passenger then
      puts "Введите число пассажирских мест"
      seat_count = gets.chomp.to_i
      return unless seat_count
      
      train.railcars_attach(PassengerRailcar.new(seat_count))
    end
  end
  
  def train_detach_railcar
    train = select_train
    return unless train
    
    railcar = select_railcar(train)
    return unless railcar
    
    train.railcars_detach(railcar)
  end
  
  
  def railcars_print(train)
    puts "К поезду не прицеплены вагоны" if train.railcars.size == 0
    
    train.railcars.each_with_index { |railcar, index| puts "#{index + 1} - вагон с числом пассажиромест - \"#{railcar.seat_count}\"" } if (train.type == :passenger)
    train.railcars.each_with_index { |railcar, index| puts "#{index + 1} - вагон с грузоподъемностью - \"#{railcar.loading_capacity}\"" } if (train.type == :cargo)
  end  
  
  
  def select_railcar(train)
    
    return if train.railcars.size == 0
    
    railcars_print(train)
    
    puts "Введите порядковый номер вагона в списке"
    railcar_number = gets.chomp.to_i
    railcar = train.railcars[railcar_number - 1]
    unless railcar then
      puts "Вагон не найден"
      return
    end
    railcar
  end
  
  def route_processing
    loop do
      case route_main_menu
        when 0
          return
        when 1
          routes_print
        when 2
          route_stations_print
        when 3
          route_create
        when 4
          route_station_add
        when 5
          route_station_remove
      end
    end
  end
  
  def routes_print
    puts "Список маршруов пуст" if @routes.size == 0
    
    @routes.each_with_index { |route, index| puts "#{index + 1} - маршрут из \"#{route.first_station.name}\" в \"#{route.last_station.name}\"" }
  end  
  
  def route_stations_print
    route = select_route
    return unless route
    
    route.stations.each { |station| puts "#{station.name}" }
  end
  
  def select_route
    routes_print
    
    puts "Введите порядковый номер маршрута в списке"
    route_number = gets.chomp.to_i
    route = routes[route_number - 1]
    unless route then
      puts "Маршрут не найден"
      return
    end
    route
  end  
  
  def routes_create
    stations_print
    return if @stations.size == 0
    
    puts "Введите порядковый номер начальной станции маршрута"
    station_start_number = gets.chomp.to_i
    station_start = @stations[station_start_number - 1]
    unless station_start then
      puts "Станция не найдена"
      return
    end
    
    puts "Введите порядковый номер конечной станции маршрута"
    station_stop_number = gets.chomp.to_i
    station_stop = @stations[station_stop_number - 1]
    unless station_stop then
      puts "Станция не найдена"
      return
    end
    
    @routes << Roures.new(station_start, station_end) unless @routess.find { |route| route.first_station == station_start && route.last_station == station_end}
  end  
  
  def route_station_add
    route = select_route
    return unless route
    
    station = select_station
    return unless station
    
    route << station unless route.stations.find { |s| s.name == station.name}
  end
  
  def route_station_remove
    route select_route
    return unless route
    
    station = select_station
    return unless station
    
    route.remove_way_station(station)
  end
  
  def main_menu
    puts
    puts "Введите 1 для работы со станциями"
    puts "Введите 2 для работы с поездами"
    puts "Введите 3 для работы с маршрутами"
    puts "Введите 0 для завершения работы"
    puts
    gets.chomp.to_i
  end
  
  def station_main_menu
    puts
    puts "Введите 1 для просмотра списка станций"
    puts "Введите 2 для создания станции"
    puts "Введите 3 для просмотра списка поездов на станции"
    puts "Введите 4 для отправки поезда"
    puts "Введите 0 для возврата в главное меню"
    puts
    gets.chomp.to_i
  end
  
  def train_main_menu
    puts
    puts "Введите 1 для просмотра списка поездов"
    puts "Введите 2 для создания поезда"
    puts "Введите 3 для назначения маршрута поезду"
    puts "Введите 4 для добавления вагона к поезду"
    puts "Введите 5 для отцепления вагона от поезда"
    puts "Введите 0 для возврата в главное меню"
    puts
    gets.chomp.to_i
  end
  
  def train_send_menu
    puts
    puts "Введите 1 для отправки поезда на следующую станцию"
    puts "Введите 2 для отправки поезда на предыдущую станцию"
    puts "Введите 0 для возврата в меню управления станциями"
    puts
  gets.chomp.to_i
  end
  
  def train_create_menu
    puts
    puts "Введите 1 для создания пассажирского поезда"
    puts "Введите 2 для создания грузового поезда"
    puts "Введите 0 для возврата в меню управления поездами"
    puts
  gets.chomp.to_i
  end
  
  def route_main_menu
    puts
    puts "Введите 1 для просмотра списка маршрутов"
    puts "Введите 2 для просмотра списка списк станций маршрута"
    puts "Введите 3 для создания маршрута"
    puts "Введите 4 для добавления к маршруту станции"
    puts "Введите 5 для удаления из маршрута станции"
    puts "Введите 0 для возврата в главное меню"
    puts
    gets.chomp.to_i
  end
  
end

stations = [
  Station.new("Москва Октябрьская"),
  Station.new("Вышний Волочек"),
  Station.new("Бологое-Московское"),
  Station.new("Окуловка"),
  Station.new("Санкт-Петербург-Главн."),
  Station.new("Калининград Пасс. Южный"),
  Station.new("Вильнюс Центр"),
  Station.new("Гудогай"),
  Station.new("Смоленск Центральный"),
  Station.new("Пенза"),
  Station.new("Самара"),
  Station.new("Уфа"),
  Station.new("Челябинск")]
  
trains = [
  PassengerTrain.new("268А"),
  PassengerTrain.new("426Ч")]
  
routes = [
  Route.new(stations.first, stations[4]),
  Route.new(stations[5], stations.last)
]

routes[0]<<stations[1]
routes[0]<<stations[2]
routes[0]<<stations[3]

routes[1]<<stations[6]
routes[1]<<stations[7]
routes[1]<<stations[8]
routes[1]<<stations[9]
#routes[1]<<stations[10]
routes[1]<<stations[11]

m = Main.new(stations, trains, routes)
m.start
