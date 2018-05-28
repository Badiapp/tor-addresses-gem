require 'tor/addresses/version'
require 'tor/addresses/record'
require 'faraday'

module Tor
  module Addresses
    EXIT_ADDRESSES_URL = 'https://check.torproject.org/exit-addresses'.freeze

    def self.list
      body = Faraday.new(url: EXIT_ADDRESSES_URL).get.body
      records = body.split("\n").each.map do |line|
        Tor::Addresses::Record.new(line) if line.start_with?('ExitAddress')
      end.compact

      records
    end
  end
end
