# frozen_string_literal: true

require 'spec_helper'

describe 'extended_stdlib::intersect' do
  if Gem::Version.new(RUBY_VERSION) >= Gem::Version.new('3.1')
    it { is_expected.to run.with_params([1, 2, 3], [3, 4, 5]).and_return(true) }
    it { is_expected.to run.with_params([1, 2, 3], [5, 6, 7]).and_return(false) }
  else
    it { is_expected.to run.with_params([1, 2, 3], [3, 4, 5]).and_raise_error(Puppet::Error, _('The intersect function is not supported in Ruby prior to version 3.1.')) }
  end
end
