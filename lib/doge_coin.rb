require "doge_coin/version"
require "doge_coin/configuration"
require "doge_coin/client"
require 'faraday'

module DogeCoin
  extend DogeCoin::Configuration

  def self.method_missing(method, *args, &block)
    new_client.send(method, *args, &block)
  end

  private

  def self.new_client
    @client ||= DogeCoin::Client.new
  end
end
