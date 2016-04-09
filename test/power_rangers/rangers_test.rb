require 'power_rangers'

require './test/test_helper'
require 'minitest/autorun'


class RangersTest < Minitest::Test
    def test_exists
        assert PowerRangers::Ranger
    end

    def test_rangers
        VCR.use_cassette('rangers/list') do
            rangers = PowerRangers::Ranger.all
            assert_instance_of Array, rangers

            ranger = rangers[0]

            assert_equal 5, ranger.id
            assert_equal 'Black Ranger', ranger.name
            assert_equal 'black', ranger.color

            assert_instance_of PowerRangers::Weapon, ranger.weapon

            # assert_equal PowerRangers::Zords, ranger.weapon
            assert_instance_of Array, ranger.zords
            assert_instance_of Array, ranger.images
        end
    end

    def test_ranger
        VCR.use_cassette('rangers/get') do
            ranger = PowerRangers::Ranger.get(1)
            assert_equal PowerRangers::Ranger, ranger.class

            assert_equal 1, ranger.id
            assert_equal 'Red Ranger', ranger.name
            assert_equal 'red', ranger.color

            assert_instance_of PowerRangers::Weapon, ranger.weapon

            # assert_equal PowerRangers::Zords, ranger.weapon
            assert_instance_of Array, ranger.zords
            assert_instance_of Array, ranger.images
        end
    end
end