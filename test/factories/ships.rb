FactoryBot.define do
  factory :ship do
    ship_measure_values {
      [
          ShipMeasureValue.new(0, 0, 0, 80),
          ShipMeasureValue.new(10, 3, 3.5, 90),
          ShipMeasureValue.new(20, 5, 2.8, 105),
          ShipMeasureValue.new(30, 8, 11.2, 131),
          ShipMeasureValue.new(40, 7.5, 12.3, 140),
          ShipMeasureValue.new(50, 11, 11.6, 162),
          ShipMeasureValue.new(60, 14, 12.8, 197),
          ShipMeasureValue.new(70, 18, 13.2, 251),
          ShipMeasureValue.new(80, 20, 21.2, 280),
          ShipMeasureValue.new(90, 22, 24.8, 310)
      ]
    }
  end
end
