require 'spec_helper'

describe DogeCoin do
  it '#get_block_count' do
    DogeCoin.respond_to?(:get_block_count).should be_false

    blockcount = DogeCoin.get_block_count

    # As recorded in the tape
    blockcount.should == 77974
    blockcount.should be_a(Integer)
  end

  it '#address_balance' do
    DogeCoin.address_balance('DFrwT5zteXdvfgz3vjhWNcpXMXDiVPmkXN').should be_within(0.1).of(18712.3)
    DogeCoin.address_balance('DMP2WQ1pjCqSNCdvn4HMFztmLG7an9hNWT').should be_within(0.1).of(0)

    ['', 'abcdef', 'DMP2WQ1pjCqSNCdvn4HMFztmLG7an9hNWT++---'].each do |invalid_address|
      expect { DogeCoin.address_balance(invalid_address) }.to raise_error(DogeCoin::InvalidAddress)
    end
  end
end
