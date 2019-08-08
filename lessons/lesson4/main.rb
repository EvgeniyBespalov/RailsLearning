require_relative 'station'

class Main

  def initialize
    @stations = []
    @trains = []
    @routes = []
  end

  def start
    loop do
      main_menu
      menu = gets.chomp.to_i
      
      case menu
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
      station_main_menu
      menu = gets.chomp.to_i
      
      case menu
        when 0
          return
        when 1
          stations_print
        when 2
          station_create
        when 3
          get_train_on_station
      end
    end
  end

  def train_processing
    puts "train_processing is developed ..."
  end

  def route_processing
    puts "route_processing is developed ..."
  end  

  def stations_print
    puts "Список станций пуст" if @stations.size == 0
    @stations.each { |stations| puts "#{stations.name}" }
  end  
  
  def station_create
    puts "Введите название станции"
    station_name = gets.chomp.to_s
    @stations << Station.new(station_name) unless @stations.find { |s| s.name == station_name }
  end
  
  def get_train_on_station
    stations_print
    return if @stations.size == 0
    puts "Введите название станции"
    station_name = gets.chomp.to_s
    station = @stations.find { |s| s.name == station_name }
    unless station then
      puts "Станция не найдена"
      return
    end
    station.trains.each { |t| puts "#{t.number}" }
    puts "Поезда на станции отсутствуют" if station.trains.size == 0
  end
  
  def main_menu
    puts
    puts "Введите 1 для работы со станциями"
    puts "Введите 2 для работы с поездами"
    puts "Введите 3 для работы с маршрутами"
    puts "Введите 0 для завершения работы"
    puts
  end
  
  def station_main_menu
    puts
    puts "Введите 1 для просмотра списка станций"
    puts "Введите 2 для создания станции"
    puts "Введите 3 для просмотра списка поездов на станции"
    puts "Введите 4 для отправки поезда на следующую станцию"
    puts "Введите 5 для отправки поезда на предыдущую станцию"
    puts "Введите 0 для возврата в главное меню"
    puts
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
  end
  
  def route_main_menu
    puts
    puts "Введите 1 для просмотра списка маршрутов"
    puts "Введите 2 для создания маршрута"
    puts "Введите 3 для добавления к маршруту станции"
    puts "Введите 4 для удаления из маршрута станции"
    puts "Введите 0 для возврата в главное меню"
    puts
  end
  
end

m = Main.new
m.start
