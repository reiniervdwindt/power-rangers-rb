require 'faraday'
require 'json'

API_URL = "http://powerapi.blueyes.nl/v1"

module PowerRangers
    class Ranger
        attr_reader :id, :name, :color

        def initialize(attributes)
            @id = attributes["id"]
            @name = attributes["name"]
            @color = attributes["color"]
        end

        def self.get(id)
            conn = Faraday.new(:url => 'http://powerapi.blueyes.nl/v1/')
            response = conn.get "rangers/#{id}/"
            attributes = JSON.parse(response.body)
            new(attributes)
        end
    end
end
