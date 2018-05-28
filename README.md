# Tor Addresses Gem
[![Gem Version](https://badge.fury.io/rb/tor-addresses.svg)](https://badge.fury.io/rb/tor-addresses)
[![Build Status](https://travis-ci.org/Badiapp/tor-addresses-gem.svg?branch=master)](https://travis-ci.org/Badiapp/tor-addresses-gem)

This is a Ruby gem for interacting with Tor exit addresses. You'll be able to find all the existing exit nodes, retrieving the nodes from https://check.torproject.org/exit-addresses.

Add this line to your application's Gemfile:

```ruby
gem 'tor-addresses'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tor-addresses

## Usage

You can retrieve all the existing exit nodes.

```ruby
    addresses_list = Tor::Addresses.list
    # => [
    #   #<Tor::Addresses::Record:0x007f92e9b80d98 @line="ExitAddress 162.247.72.201 2018-05-28 13:04:26">,
    #   ...
    #   #<Tor::Addresses::Record:0x007f92e9bfa468 @line="ExitAddress 153.126.210.34 2018-05-28 08:13:57">
    # ]
```

Those `Tor::Addresses::Record` object respond to `address` and `found_at`.

```ruby
    addresses_list.first.address
    # => '162.247.72.201'
    addresses_list.first.found_at.to_s
    # => '2018-05-28T13:04:26+00:00'
```

In order to keep the main method reusable, we've decided to just return an Array.

```ruby
    ## You can get the number of nodes
    addresses_list.count
    # => 979

    ## You can check if an IP is a Tor exit node
    addresses_list.any? { |record| record.address == '162.247.72.201' }
    # => true
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Badiapp/tor-addresses-gem.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
