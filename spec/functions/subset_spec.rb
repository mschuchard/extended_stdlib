# frozen_string_literal: true

require 'spec_helper'

describe 'extended_stdlib::subset' do
  it { is_expected.to run.with_params({'foo' => 0, 'bar' => 1}, {'foo' => 0, 'bar' => 1, 'baz' => 2}).and_return(true) }
  it { is_expected.to run.with_params({'foo' => 0, 'bar' => 1, 'baz' => 2}, {'foo' => 0, 'bar' => 1}).and_return(false) }
  it { is_expected.to run.with_params({'foo' => 0, 'bar' => 1}, {'foo' => 0, 'bar' => 1}).and_return(true) }
  it { is_expected.to run.with_params({'foo' => 0, 'bar' => 1}, {'foo' => 0, 'bar' => 1}, true).and_return(false) }
end
