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
    # Returns the current difficulty
    def get_difficulty
      call_blockchain_api('getdifficulty').to_f
    end

    # Returns the address balance
    # Raise error if address is invalid
    def address_balance address
      balance = call_blockchain_api("addressbalance/#{address}")

      raise DogeCoin::InvalidAddress unless is_a_float?(balance)

      balance.to_f
    end

    # Shows the 160-bit hash encoded in ADDRESS.
    # For BBE compatibility, the address is not checked for validity.
    def address_to_hash address
      call_blockchain_api("addresstohash/#{address}")
    end

    # Converts a 160-bit hash and address version to an address.
    def hash_to_address address
      call_blockchain_api("hashtoaddress/#{address}")
    end

    # Returns true if the adress is valid, and false otherwise
    def valid_address? address
      code = call_blockchain_api("checkaddress/#{address}")

      !['X5', 'SZ', 'CK'].include?(code)
    end

    # Shows ADDRESS's version byte(s) and public key hash as hex strings separated by colon (":").
    def decode_address address, skip_validation = false
      call_blockchain_api("decode_address/#{address}")
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
