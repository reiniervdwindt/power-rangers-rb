require 'httpclient'
require 'json'


module PowerRangers
    class Base

        API_URL = 'http://powerapi.blueyes.nl/v1'
        CLIENT = HTTPClient.new

        private

        def self.request(url)
            response = CLIENT.get_content(url)
            JSON.parse(response) if response
        end
    end
end
