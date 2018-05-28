require 'bundler/setup'
require 'tor/addresses'
require 'vcr'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

VCR.configure do |config|
  config.hook_into :faraday
  config.cassette_library_dir = 'spec/cassettes'
  config.default_cassette_options = { record: :new_episodes }
end
