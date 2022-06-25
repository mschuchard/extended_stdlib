# frozen_string_literal: true

require 'spec_helper'

describe 'extended_stdlib::decrypt_string' do
  encrypted = File.read("#{__dir__}/../fixtures/encrypted.txt")

  it { is_expected.to run.with_params("#{__dir__}/../fixtures/key.txt", "#{__dir__}/../fixtures/nonce.txt", encrypted).and_return('foobar') }
  it { is_expected.to run.with_params('/tmp/foo.txt', "#{__dir__}/../fixtures/nonce.txt", encrypted).and_raise_error(Puppet::Error, 'The key file is not an existing readable file.') }
  it { is_expected.to run.with_params("#{__dir__}/decrypt_string_spec.rb", "#{__dir__}/../fixtures/nonce.txt", encrypted).and_raise_error(Puppet::Error, 'The key is not a valid 32 byte key.') }
  it { is_expected.to run.with_params("#{__dir__}/../fixtures/key.txt", "#{__dir__}/decrypt_string_spec.rb", encrypted).and_raise_error(Puppet::Error, 'The nonce is not a valid 16 byte nonce.') }
  it { is_expected.to run.with_params("#{__dir__}/../fixtures/key.txt", "#{__dir__}/../fixtures/nonce.txt", "#{__dir__}/../default_facts.yml").and_raise_error(Puppet::Error, 'The encrypted data is not a valid multiple of 16 bytes.') }
end
