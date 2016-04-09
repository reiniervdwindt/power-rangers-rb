require './test/test_helper'
require 'minitest/autorun'

class WeaponsTest < Minitest::Test
    def test_exists
        assert PowerRangers::Weapon
    end

    def test_rangers
        VCR.use_cassette('weapons/list') do
            weapons = PowerRangers::Weapon.all
            assert_instance_of Array, weapons

            weapon = weapons[0]

            assert_equal 7, weapon.id
            assert_equal 'Dragon Dagger', weapon.name
            assert_equal 'dagger', weapon.type

            assert_instance_of PowerRangers::Ranger, weapon.ranger
            assert_instance_of Array, weapon.images
        end
    end

    def test_ranger
        VCR.use_cassette('weapons/get') do
            weapon = PowerRangers::Weapon.get(1)
            assert_equal PowerRangers::Weapon, weapon.class

            assert_equal 1, weapon.id
            assert_equal 'Power Sword', weapon.name
            assert_equal 'sword', weapon.type

            assert_instance_of PowerRangers::Ranger, weapon.ranger
            assert_instance_of Array, weapon.images
        end
    end
end