require_relative 'railcar' 

class PassengerRailcar < Railcar

  attr_reader :seat_count

  def initialize(seat_count)
    @seat_count = seat_count
  end
  
  private
  
  attr_writer :seat_count
  
end
