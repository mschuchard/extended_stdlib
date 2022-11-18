# frozen_string_literal: true
require 'spec_helper'

describe 'extended_stdlib::script' do
  let(:title) { 'myscript.sh' }

  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile }
    end
  end
end
