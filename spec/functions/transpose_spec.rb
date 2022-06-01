# frozen_string_literal: true

require 'spec_helper'

describe 'extended_stdlib::transpose' do
  it { is_expected.to run.with_params([['a0', 'a1']]).and_return([['a0'], ['a1']]) }
  it { is_expected.to run.with_params([['a0', 'a1'], ['b0', 'b1'], ['c0', 'c1']]).and_return([['a0', 'b0', 'c0'], ['a1', 'b1', 'c1']]) }
end
