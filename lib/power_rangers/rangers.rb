module PowerRangers
    class Ranger < Base

        attr_reader :id
        attr_reader :name
        attr_reader :color
        attr_reader :weapon
        attr_reader :zords
        attr_reader :images

        def initialize(attributes)
            @id = attributes['id']
            @name = attributes['name']
            @color = attributes['color']
            @images = attributes['images']
            @zords = attributes['zords']

            @weapon = if attributes['weapon']
                          Weapon.new attributes['weapon']
                      end
        end

        def self.all
            rangers = request "#{API_URL}/rangers/"
            rangers.map { |attributes| Ranger.new attributes }
        end

        def self.get(id)
            new(request "#{API_URL}/rangers/#{id}/")
        end
    end
end
