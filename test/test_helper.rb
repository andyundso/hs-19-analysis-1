require 'minitest/autorun'
require 'factory_bot'

class TestHelper < Minitest::Test
  include FactoryBot::Syntax::Methods
end
