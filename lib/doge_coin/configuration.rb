require 'vcr'

module DogeCoin
  module Configuration
    attr_accessor :vcr_mode

    DOGECHAIN_BASE_URL = 'http://dogechain.info/chain/Dogecoin/q/'

    def configure
      yield self
    end

    def self.configure_vcr
      VCR.configure do |c|
        c.cassette_library_dir = 'spec/blockchain_captured_responses'
        c.default_cassette_options = { serialize_with: :json }
        c.preserve_exact_body_bytes do |http_message|
          http_message.body.encoding.name == 'ASCII-8BIT' || !http_message.body.valid_encoding?
        end
        c.hook_into :webmock
      end
    end
  end
end
