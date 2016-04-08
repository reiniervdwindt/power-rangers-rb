#test/power_rangers/rangers_test.rb
require './test/test_helper'

class RangersTest < Minitest::Test
    def test_exists
        assert PowerRangers::Ranger
    end

    def test_ranger
        VCR.use_cassette('one_car') do
            ranger = PowerRangers::Ranger.get(1)
            assert_equal PowerRangers::Ranger, ranger.class

            assert_equal 1, ranger.id
            assert_equal "Red Ranger", ranger.name
            assert_equal "red", ranger.color
        end
    end
end