class Ship
  attr_accessor :ship_measure_values

  def initialize
    @ship_measure_values = []
  end

  def fuel_per_hour(speed_on_surface)
    min_recorded_value = ship_measure_values.map(&:speed_on_surface).min
    max_record_value = ship_measure_values.map(&:speed_on_surface).max

    unless min_recorded_value <= speed_on_surface && speed_on_surface <= max_record_value
      throw ArgumentError.new("This value is out of the recorded range")
    end

    measure_value = ship_measure_values.find { |measure_value| measure_value.speed_on_surface == speed_on_surface}

    if measure_value
      measure_value.fuel_per_hour
    else
      fuel_per_hour_linear speed_on_surface
    end
  end

  private

  def fuel_per_hour_linear(speed_on_surface)
    next_lower_value = ship_measure_values.first
    next_bigger_value = ship_measure_values.first

    ship_measure_values.each do |ship_measure_value|
      difference_to_input = ship_measure_value.speed_on_surface - speed_on_surface

      if next_lower_value.speed_on_surface - speed_on_surface < 0 || (difference_to_input > 0 && difference_to_input < next_lower_value.speed_on_surface - speed_on_surface)
        next_lower_value = ship_measure_value
      end

      if next_bigger_value.speed_on_surface - speed_on_surface > 0 || (difference_to_input < 0 && difference_to_input > next_bigger_value.speed_on_surface - speed_on_surface)
        next_bigger_value = ship_measure_value
      end
    end

    (next_lower_value.fuel_per_hour + next_bigger_value.fuel_per_hour) / 2
  end
end
