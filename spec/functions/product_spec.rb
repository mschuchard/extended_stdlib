# frozen_string_literal: true

require 'spec_helper'

describe 'extended_stdlib::product' do
  it { is_expected.to run.with_params([[0, 1, 2]]).and_return([[0, 1, 2]]) }
  it { is_expected.to run.with_params([[0, 1, 2], [3, 4]]).and_return([[0, 3], [0, 4], [1, 3], [1, 4], [2, 3], [2, 4]]) }
  it { is_expected.to run.with_params([[0, 1, 2], [3, 4], [5, 6]]).and_return([[0, 3, 5], [0, 3, 6], [0, 4, 5], [0, 4, 6], [1, 3, 5], [1, 3, 6], [1, 4, 5], [1, 4, 6], [2, 3, 5], [2, 3, 6], [2, 4, 5], [2, 4, 6]]) }
end
