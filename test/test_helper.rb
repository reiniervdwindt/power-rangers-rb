require 'minitest/autorun'
require 'webmock/minitest'
require 'vcr'

require 'power_rangers/rangers'

VCR.configure do |c|
  c.cassette_library_dir = 'test/fixtures'
  c.hook_into :webmock
end