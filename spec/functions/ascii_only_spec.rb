# frozen_string_literal: true

require 'spec_helper'

describe 'extended_stdlib::ascii_only' do
  it { is_expected.to run.with_params('abc').and_return(true) }
  it { is_expected.to run.with_params("abc\u{6666}").and_return(false) }
end
