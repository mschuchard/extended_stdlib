require 'spec_helper'

describe 'extended_stdlib::imperative' do
  it { is_expected.to run.with_params([Puppet::Resource.new(:user, 'foo'), Puppet::Resource.new(:user, 'bar')]).and_return([Puppet::Resource.new(:user, 'foo'), Puppet::Resource.new(:user, 'bar')]) }
end
