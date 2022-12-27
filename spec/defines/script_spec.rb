require 'spec_helper'

describe 'extended_stdlib::script' do
  let(:title) { 'myscript.sh' }

  context 'on any os' do
    it { is_expected.to compile }
  end
end
