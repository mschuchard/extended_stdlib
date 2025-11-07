# frozen_string_literal: true

require 'spec_helper'

describe 'extended_stdlib::center' do
  it { is_expected.to run.with_params('hello', 4).and_return('hello') }
  it { is_expected.to run.with_params('hello', 20).and_return('       hello        ') }
  it { is_expected.to run.with_params('hello', 20, '#-').and_return('#-#-#-#hello#-#-#-#-') }
  it { is_expected.to run.with_params('hello', -1, '*').and_raise_error(Puppet::Error, _('Width must be a non-negative integer')) }
end
