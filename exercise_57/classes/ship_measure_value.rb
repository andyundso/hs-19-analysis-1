class ShipMeasureValue
  attr_accessor :abs_gps_speed
  attr_accessor :fuel_per_hour
  attr_accessor :speed_on_surface
  attr_accessor :time

  def initialize(time, speed_on_surface, abs_gps_speed, fuel_per_hour)
    @time = time
    @abs_gps_speed = abs_gps_speed
    @fuel_per_hour = fuel_per_hour
    @speed_on_surface = speed_on_surface
  end
end
