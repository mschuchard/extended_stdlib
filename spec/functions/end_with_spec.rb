# frozen_string_literal: true

require 'spec_helper'

describe 'extended_stdlib::end_with' do
  it { is_expected.to run.with_params('hello', ['ello']).and_return(true) }
  it { is_expected.to run.with_params('hello', ['heaven', 'ello']).and_return(true) }
  it { is_expected.to run.with_params('hello', ['heaven', 'paradise']).and_return(false) }
end
