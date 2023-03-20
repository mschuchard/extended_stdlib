# frozen_string_literal: true

require 'spec_helper'

describe 'extended_stdlib::next' do
  it { is_expected.to run.with_params('THX1138').and_return('THX1139') }
  it { is_expected.to run.with_params('<<koala>>').and_return('<<koalb>>') }
  it { is_expected.to run.with_params('***').and_return('**+') }
  it { is_expected.to run.with_params('00').and_return('01') }
  it { is_expected.to run.with_params('09').and_return('10') }
  it { is_expected.to run.with_params('99').and_return('100') }
  it { is_expected.to run.with_params('aa').and_return('ab') }
  it { is_expected.to run.with_params('az').and_return('ba') }
  it { is_expected.to run.with_params('zz').and_return('aaa') }
end
