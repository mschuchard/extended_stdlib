# frozen_string_literal: true

require 'spec_helper'

describe 'extended_stdlib::decrypt_string' do
  key = "#{__dir__}/../fixtures/key.txt"
  nonce = "#{__dir__}/../fixtures/nonce.txt"
  encrypted = File.read("#{__dir__}/../fixtures/encrypted.txt")
  require 'securerandom'

  it { is_expected.to run.with_params(key, nonce, encrypted).and_return('foobar') }
  it { is_expected.to run.with_params('/tmp/foo.txt', nonce, encrypted).and_raise_error(Puppet::Error, 'The key file is not an existing readable file.') }
  it { is_expected.to run.with_params("#{__dir__}/decrypt_string_spec.rb", nonce, encrypted).and_raise_error(Puppet::Error, 'The key is not a valid 32 byte key.') }
  it { is_expected.to run.with_params(key, "#{__dir__}/decrypt_string_spec.rb", encrypted).and_raise_error(Puppet::Error, 'The nonce is not a valid 16 byte nonce.') }
  it { is_expected.to run.with_params(key, nonce, SecureRandom.random_bytes(4).strip).and_raise_error(Puppet::Error, 'The encrypted data is not a valid multiple of 16 bytes.') }
end
