# frozen_string_literal: true

require 'spec_helper'

describe 'extended_stdlib::start_with' do
  it { is_expected.to run.with_params('hello', ['hell']).and_return(true) }
  it { is_expected.to run.with_params('hello', [%r{h}]).and_return(true) }
  it { is_expected.to run.with_params('hello', ['heaven', 'hell']).and_return(true) }
  it { is_expected.to run.with_params('hello', ['heaven', 'paradise']).and_return(false) }
end
