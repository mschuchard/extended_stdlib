# frozen_string_literal: true

require 'spec_helper'

describe 'extended_stdlib::sqrt' do
  it { is_expected.to run.with_params(2).and_return(1.4142135623730951) }
  it { is_expected.to run.with_params(4).and_return(2.0) }
  it { is_expected.to run.with_params(9).and_return(3.0) }
end
