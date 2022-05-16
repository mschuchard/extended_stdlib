# frozen_string_literal: true

require 'spec_helper'

describe 'extended_stdlib::minmax' do
  it { is_expected.to run.with_params([0, 1, 2]).and_return([0, 2]) }
  it { is_expected.to run.with_params([0]).and_raise_error(ArgumentError) }
end
