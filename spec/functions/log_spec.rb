# frozen_string_literal: true

require 'spec_helper'

describe 'extended_stdlib::log' do
  it { is_expected.to run.with_params(1).and_return(0.0) }
  it { is_expected.to run.with_params(12, 3).and_return(2.2618595071429146) }
  it { is_expected.to run.with_params(1000.0, 10).and_return(2.9999999999999996) }
  it { is_expected.to run.with_params(0).and_raise_error(Puppet::Error, _('Number must be a positive number')) }
  it { is_expected.to run.with_params(10, 1).and_raise_error(Puppet::Error, _('Logarithm base must be a positive number not equal to 1')) }
  it { is_expected.to run.with_params(10, -1).and_raise_error(Puppet::Error, _('Logarithm base must be a positive number not equal to 1')) }
end
