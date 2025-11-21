require 'openssl'
# frozen_string_literal: true

# Returns a decrypted String using the AES-256-CBC OpenSSL cipher algorithm.
Puppet::Functions.create_function(:'extended_stdlib::decrypt_string') do
  # @param key The path to the file containing the cipher key.
  # @param nonce The path to the file containing the cipher nonce.
  # @param encrypted The path to the file containing the encrypted string to decrypt.
  # @return String Returns the encrypted string as decrypted in plain text.
  # @example Decrypt an encrypted string and return it plain text.
  #   decrypt_string('/path/to/key.txt', '/path/to/nonce.txt', '/path/to/encrypted.txt') => foobar
  dispatch :decrypt_string do
    # types are re-used from Stdlib::Unixpath
    param 'Pattern[/\A\/([^\n\/\0]+\/*)*\z/]', :key
    param 'Pattern[/\A\/([^\n\/\0]+\/*)*\z/]', :nonce
    param 'String', :encrypted
    return_type 'String'
  end

  def decrypt_string(key, nonce, encrypted)
    # read in key and nonce files
    key = File.readable?(key) ? File.read(key) : (raise Puppet::Error, _('The key file is not an existing readable file.'))
    nonce = File.readable?(nonce) ? File.read(nonce) : (raise Puppet::Error, _('The nonce file is not an existing readable file.'))

    # validate key, nonce, and encrypted
    raise Puppet::Error, _('The key is not a valid 32 byte key.') unless key.bytesize == 32
    raise Puppet::Error, _('The nonce is not a valid 16 byte nonce.') unless nonce.bytesize == 16
    raise Puppet::Error, _('The encrypted data is not a valid multiple of 16 bytes.') unless (encrypted.bytesize % 16).zero?

    # setup the decryption parameters
    decipher = OpenSSL::Cipher.new('aes-256-cbc').decrypt
    decipher.key = key
    decipher.iv = nonce

    # return decrypted string
    decipher.update(encrypted) + decipher.final
  end
end
