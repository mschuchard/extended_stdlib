# frozen_string_literal: true

require 'spec_helper'

describe 'extended_stdlib::compact' do
  it { is_expected.to run.with_params({ 'foo' => 0, 'bar' => nil, 'baz' => 2, 'bat' => nil }).and_return({ 'foo' => 0, 'baz' => 2 }) }
  it { is_expected.to run.with_params([nil, 0, nil, 1, nil, 2, nil]).and_return([0, 1, 2]) }
end
