require 'minitest/autorun'
require_relative '../classes/ship'
require_relative '../classes/ship_measure_value'

class ShipTest < Minitest::Test
  def setup
    @ship = Ship.new

    @ship.ship_measure_values << ShipMeasureValue.new(0, 0, 0, 80)
    @ship.ship_measure_values << ShipMeasureValue.new(10, 3, 3.5, 90)
    @ship.ship_measure_values << ShipMeasureValue.new(20, 5, 2.8, 105)
    @ship.ship_measure_values << ShipMeasureValue.new(30, 8, 11.2, 131)
    @ship.ship_measure_values << ShipMeasureValue.new(40, 7.5, 12.3, 140)
    @ship.ship_measure_values << ShipMeasureValue.new(50, 11, 11.6, 162)
    @ship.ship_measure_values << ShipMeasureValue.new(60, 14, 12.8, 197)
    @ship.ship_measure_values << ShipMeasureValue.new(70, 18, 13.2, 251)
    @ship.ship_measure_values << ShipMeasureValue.new(80, 20, 21.2, 280)
    @ship.ship_measure_values << ShipMeasureValue.new(90, 22, 24.8, 310)
  end

  def test_results_for_speeds
    # exact hit
    assert_equal(80, @ship.fuel_per_hour(0))

    # linear calculation
    assert_equal((195/2), @ship.fuel_per_hour(4))
    assert_equal((162+197)/2, @ship.fuel_per_hour(12))

    # out of range
    assert_raises ArgumentError do
      @ship.fuel_per_hour(80)
    end
  end
end
