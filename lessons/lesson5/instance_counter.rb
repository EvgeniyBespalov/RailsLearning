module InstanceCounter
  @@instances = 0
  
  protected
  
  def register_instance
    @@instances++
  end
end
