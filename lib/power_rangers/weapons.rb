module PowerRangers
    class Weapon < Base

        attr_reader :id, :name, :type, :ranger, :images

        def initialize(attributes)
            @id = attributes['id']
            @name = attributes['name']
            @type = attributes['type']
            @images = attributes['images']

            @ranger = if attributes['ranger']
                          Ranger.new attributes['ranger']
                      end
        end

        def self.all
            weapons = request "#{API_URL}/weapons/"
            weapons.map { |attributes| Weapon.new attributes }
        end

        def self.get(id)
            new(request "#{API_URL}/weapons/#{id}/")
        end
    end
end
