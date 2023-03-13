# frozen_string_literal: true

require 'spec_helper'

describe 'extended_stdlib::translate' do
  it { is_expected.to run.with_params('hello', 'el', 'ip').and_return('hippo') }
  it { is_expected.to run.with_params('hello', 'aeiou', '*').and_return('h*ll*') }
  it { is_expected.to run.with_params('hello', 'aeiou', 'AA*').and_return('hAll*') }
end
