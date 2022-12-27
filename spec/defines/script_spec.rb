require 'spec_helper'

describe 'extended_stdlib::script' do
  before(:all) do
    File.write("#{File.dirname(__FILE__)}/../../templates/mytemplate.erb", '')
    File.write("#{File.dirname(__FILE__)}/../../templates/mytemplate.epp", '')
  end

  after(:all) do
    File.delete("#{File.dirname(__FILE__)}/../../templates/mytemplate.erb")
    File.delete("#{File.dirname(__FILE__)}/../../templates/mytemplate.epp")
  end

  context 'with a static source file' do
    let(:title) { 'myscript.sh' }

    it { is_expected.to compile }
  end

  context 'with a erb template' do
    let(:title) { 'mytemplate.erb' }
    let(:params) { { module: 'extended_stdlib' } }

    it { is_expected.to compile }
  end

  context 'with a epp template' do
    let(:title) { 'mytemplate.epp' }
    let(:params) { { module: 'extended_stdlib', epp_vars: { foo: 'bar' } } }

    it { is_expected.to compile }
  end
end
