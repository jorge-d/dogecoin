require 'spec_helper'

describe DogeCoin do
  ADDRESS_FOR_DONATIONS = 'DMP2WQ1pjCqSNCdvn4HMFztmLG7an9hNWT'
  HASH_FROM_ADDRESS_FOR_DONATION = 'B224785E7F7D213AF75AB440DB1108C07ED38D80'

  it '#get_block_count' do
    blockcount = DogeCoin.get_block_count

    # As recorded in the tape
    blockcount.should == 77974
    blockcount.should be_a(Integer)
  end
  it '#get_difficulty' do
    difficulty = DogeCoin.get_difficulty

    # As recorded in the tape
    difficulty.should == 1009.723
    difficulty.should be_a(Float)
  end
  it '#get_total_mined' do
    difficulty = DogeCoin.get_total_mined

    # As recorded in the tape
    difficulty.should be_within(0.1).of(38898180040.5)
    difficulty.should be_a(Float)
  end

  it '#address_balance' do
    DogeCoin.address_balance('DFrwT5zteXdvfgz3vjhWNcpXMXDiVPmkXN').should be_within(0.1).of(18712.3)
    DogeCoin.address_balance(ADDRESS_FOR_DONATIONS).should be_within(0.1).of(0)

    ['', 'abcdef', "#{ADDRESS_FOR_DONATIONS}+---"].each do |invalid_address|
      expect { DogeCoin.address_balance(invalid_address) }.to raise_error(DogeCoin::InvalidAddress)
    end
  end
  it '#total_received' do
    DogeCoin.total_received('DFrwT5zteXdvfgz3vjhWNcpXMXDiVPmkXN').should be_within(0.1).of(18712.3)
    DogeCoin.total_received(ADDRESS_FOR_DONATIONS).should be_within(0.1).of(0)

    ['', 'abcdef', "#{ADDRESS_FOR_DONATIONS}+---"].each do |invalid_address|
      expect { DogeCoin.total_received(invalid_address) }.to raise_error(DogeCoin::InvalidAddress)
    end
  end
  it '#total_sent' do
    DogeCoin.total_sent('DABmu1j1hD2HeFEiMGUByuc1HwwZguQvWg').should be_within(0.1).of(86136.8)
    DogeCoin.total_sent(ADDRESS_FOR_DONATIONS).should be_within(0.1).of(0)

    ['', 'abcdef', "#{ADDRESS_FOR_DONATIONS}+---"].each do |invalid_address|
      expect { DogeCoin.total_sent(invalid_address) }.to raise_error(DogeCoin::InvalidAddress)
    end
  end

  it '#address_to_hash & #hash_to_address' do
    hash = DogeCoin.address_to_hash(ADDRESS_FOR_DONATIONS)

    hash.should == HASH_FROM_ADDRESS_FOR_DONATION

    DogeCoin.hash_to_address(hash).should == ADDRESS_FOR_DONATIONS
  end

  it '#valid_address?' do
    DogeCoin.valid_address?(ADDRESS_FOR_DONATIONS).should be_true
    DogeCoin.valid_address?('lol').should be_false
    DogeCoin.valid_address?("#{ADDRESS_FOR_DONATIONS}BB").should be_false
  end

  it '#decode_address' do
    DogeCoin.decode_address(ADDRESS_FOR_DONATIONS).should == "1e:#{HASH_FROM_ADDRESS_FOR_DONATION}"
  end
end
