require 'spec_helper'

describe 'extended_stdlib::imperative' do
  let(:pre_condition) do
    <<~PUPPET
      user { 'foo': }
      user { 'bar': }
    PUPPET
  end

  it { is_expected.to run.with_params([Puppet::Resource.new(:user, 'foo'), Puppet::Resource.new(:user, 'bar')]).and_return([Puppet::Resource.new(:user, 'foo'), Puppet::Resource.new(:user, 'bar')]) }
  it { is_expected.to run.with_params([Puppet::Resource.new(:user, 'foo'), Puppet::Resource.new(:user, 'baz')]).and_raise_error(Puppet::PreformattedError, %r{The resource User\[baz\] is not declared and thus cannot be used with dependency mapping for imperative application}) }
end
