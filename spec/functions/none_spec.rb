# frozen_string_literal: true

require 'spec_helper'

describe 'extended_stdlib::none' do
  it { is_expected.to run.with_params([nil, false]).and_return(true) }
  it { is_expected.to run.with_params([nil, 0, false]).and_return(false) }
  it { is_expected.to run.with_params([]).and_return(true) }
end
