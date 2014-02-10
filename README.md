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

There is a call mapped for all the [dogechain API](http://dogechain.info/chain/Dogecoin/q) as follow:

* [nethash (interval, start, end)](http://dogechain.info/chain/DogeCoin/q/nethash)
* [get_block_count](http://dogechain.info/chain/DogeCoin/q/getblockcount)
* [get_difficulty](http://dogechain.info/chain/DogeCoin/q/getdifficulty)
* [get_total_mined](http://dogechain.info/chain/DogeCoin/q/totalbc)
* [transactions](http://dogechain.info/chain/DogeCoin/q/transactions)
* [address_balance (address)](http://dogechain.info/chain/DogeCoin/q/addressbalance)
* [total_received (address)](http://dogechain.info/chain/DogeCoin/q/getreceivedbyaddress)
* [total_sent (address)](http://dogechain.info/chain/DogeCoin/q/getsentbyaddress)
* [address_to_hash (address)](http://dogechain.info/chain/DogeCoin/q/addresstohash)
* [hash_to_address (address)](http://dogechain.info/chain/DogeCoin/q/hashtoaddress)
* [valid_address? (address)](http://dogechain.info/chain/DogeCoin/q/checkaddress)
* [decode_address (address)](http://dogechain.info/chain/DogeCoin/q/decode_address)

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
