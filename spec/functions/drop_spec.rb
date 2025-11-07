# frozen_string_literal: true

require 'spec_helper'

describe 'extended_stdlib::drop' do
  it { is_expected.to run.with_params([0, 1, 2, 3, 4, 5], 0).and_return([0, 1, 2, 3, 4, 5]) }
  it { is_expected.to run.with_params([0, 1, 2, 3, 4, 5], 1).and_return([1, 2, 3, 4, 5]) }
  it { is_expected.to run.with_params([0, 1, 2, 3, 4, 5], 2).and_return([2, 3, 4, 5]) }
  it { is_expected.to run.with_params([0, 1, 2, 3, 4, 5], -1).and_raise_error(Puppet::Error, _('Number of elements must be a non-negative integer')) }
end
