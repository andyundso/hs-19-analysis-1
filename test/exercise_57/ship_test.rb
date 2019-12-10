require 'minitest/autorun'
require_relative '../../classes/ship'
require_relative '../../classes/ship_measure_value'
require_relative '../test_helper'

class ShipTest < TestHelper
  def setup
    FactoryBot.find_definitions
    @ship = build(:ship)
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
