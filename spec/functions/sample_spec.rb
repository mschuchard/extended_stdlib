# frozen_string_literal: true

require 'spec_helper'

describe 'extended_stdlib::sample' do
  it { is_expected.to run.with_params([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]) and be_between(1, 10).inclusive }
  it { is_expected.to run.with_params([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 3) and  have_attributes(size: 3) }
  it { is_expected.to run.with_params([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 6) and have_attributes(size: 6) }
end
