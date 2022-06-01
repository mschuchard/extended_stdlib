# frozen_string_literal: true

require 'spec_helper'

describe 'extended_stdlib::sum' do
  it { is_expected.to run.with_params([0, 1, 2, 3]).and_return(6) }
  it { is_expected.to run.with_params([0, 1, 2, 3], 100).and_return(106) }
  it { is_expected.to run.with_params(['abc', 'def', 'ghi'], 'jkl').and_return('jklabcdefghi') }
end
