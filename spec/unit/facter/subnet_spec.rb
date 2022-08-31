require 'spec_helper'
require 'facter'
require 'facter/subnet'

describe :subnet, type: :fact do
  subject(:fact) { Facter.fact(:subnet) }

  before :each do
    # perform any action that should be run before every test
    Facter.clear
  end

  it 'returns the subnet from the ip address' do
    # facter from puppet < 6 has issues with this test
    if Gem::Version.new(Puppet::PUPPETVERSION) >= Gem::Version.new('6.0.0')
      expect(Facter.value(:networking)['ip']).to match(%r{#{fact.value}})
    end
  end
end
