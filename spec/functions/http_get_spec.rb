# frozen_string_literal: true

require 'spec_helper'

describe 'extended_stdlib::http_get' do
  it { is_expected.to run.with_params('www.google.com', '/') }
end
