# frozen_string_literal: true
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
    expect(Facter.value(:networking)['ip']).to match(/#{fact.value}/)
  end
end
