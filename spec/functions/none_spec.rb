# frozen_string_literal: true

require 'spec_helper'

describe 'extended_stdlib::none' do
  it { is_expected.to run.with_params([nil, false]).and_return(true) }
  it { is_expected.to run.with_params([nil, 0, false]).and_return(false) }
  it { is_expected.to run.with_params([]).and_return(true) }
  it {
    is_expected.to run
      .with_params(['key1', 1, 2, 2])
      .with_lambda { |index, value| (index % 2) && !value.is_a?(String) }
      .and_return(false)
  }
  it {
    is_expected.to run
      .with_params(['key1', 1, 2, 2])
      .with_lambda { |index, value| (index % 2) && value.is_a?(String) }
      .and_return(true)
  }
  # TODO: combined block input forms
end
