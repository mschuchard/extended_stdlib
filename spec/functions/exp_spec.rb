# frozen_string_literal: true

require 'spec_helper'

describe 'extended_stdlib::exp' do
  it { is_expected.to run.with_params(0).and_return(1.0) }
  it { is_expected.to run.with_params(1).and_return(2.718281828459045) }
  it { is_expected.to run.with_params(1.5).and_return(4.4816890703380645) }
end
