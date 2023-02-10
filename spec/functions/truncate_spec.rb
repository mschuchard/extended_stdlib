# frozen_string_literal: true

require 'spec_helper'

describe 'extended_stdlib::truncate' do
  it { is_expected.to run.with_params(555, -1).and_return(550) }
  it { is_expected.to run.with_params(555, -2).and_return(500) }
  it { is_expected.to run.with_params(-555, -2).and_return(-500) }
  it { is_expected.to run.with_params(555).and_return(555) }
  it { is_expected.to run.with_params(555, 50).and_return(555) }
end
