# DogeCoin

[![Code Climate](https://codeclimate.com/github/jorge-d/dogecoin.png)](https://codeclimate.com/github/jorge-d/dogecoin) [![Gem Version](https://badge.fury.io/rb/doge_coin.png)](http://badge.fury.io/rb/doge_coin) [![Build Status](https://travis-ci.org/jorge-d/dogecoin.png?branch=master)](https://travis-ci.org/jorge-d/dogecoin) [![Dependency Status](https://gemnasium.com/jorge-d/dogecoin.png)](https://gemnasium.com/jorge-d/dogecoin)

The purpose of this gem is to explore the DogeCoin blockchain.
For the moment it wraps the [Dogechain](http://dogechain.info) API, but this could change in the future.

## Installation

Add this line to your application's Gemfile:

    gem 'doge_coin'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install doge_coin

## Usage

### Instruction

There is a call mapped for nearly all the [dogechain API](http://dogechain.info/chain/Dogecoin/q).

The current calls are:
```ruby
get_block_count
get_difficulty
get_total_mined
transactions
address_balance (address)
total_received (address)
total_sent (address)
address_to_hash (address)
hash_to_address (address)
valid_address? (address)
decode_address (address)
```

In a close-future, I would like to add methods to check if an address received new transactions, check how much validations it got etc...

Feel free to contribute !

### Configuration

You can configure the gem to use [VCR](https://github.com/vcr/vcr) (e.g: for test purpose).
Simply add the following to your spec_helper.rb

```ruby
DogeCoin.configure do |c|
  c.vcr_mode = true
end
```

## Testing

Checkout the gem, then simply run
```shell
rspec
```

## Contributing

1. Fork it ( http://github.com/jorge-d/dogecoin/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
