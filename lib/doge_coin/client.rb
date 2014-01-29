require 'doge_coin/errors'
require 'faraday'

module DogeCoin
  class Client
    include Faraday
    VALID_FLOAT_REGEXP = /\A(\d)+(\.\d+)?\z/

    # Returns the current block count
    def get_block_count
      call_blockchain_api('getblockcount').to_i
    end

    # Returns the address balance
    # Raise error if address is invalid
    def address_balance address
      balance = call_blockchain_api("addressbalance/#{address}")

      raise DogeCoin::InvalidAddress unless is_a_float?(balance)

      balance.to_f
    end


    private
    def is_a_float? nb
      nb.match(VALID_FLOAT_REGEXP) ? true : false
    end
    def call_blockchain_api(params)
      if DogeCoin.vcr_mode
        DogeCoin::Configuration.configure_vcr

        ::VCR.use_cassette(params, match_requests_on: [:method, :uri]) do
          do_call params
        end
      else
        do_call params
      end
    end
    def do_call params
      Faraday.get(DogeCoin::Configuration::DOGECHAIN_BASE_URL + params).body
    end
  end
end
