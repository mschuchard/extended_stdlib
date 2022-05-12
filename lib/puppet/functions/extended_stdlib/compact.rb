# frozen_string_literal: true

# https://github.com/puppetlabs/puppet-specifications/blob/master/language/func-api.md#the-4x-api
Puppet::Functions.create_function(:"extended_stdlib::compact") do
  # returns a hash with all of the undef value entries removed
  # @param [Hash] hash The hash from which to remove the undef value entries.
  # @return [Hash] The hash with all of the undef value entries removed.
  # @example Input a hash and return it compacted.
  #   compact({'foo' => 0, 'bar' => undef, 'baz' => 2, 'bat' => undef}) => {'foo' => 0, 'baz' => 2}
  dispatch :compact do
    param 'Hash', :a_hash
    return_type 'Hash'
  end

  def compact(a_hash)
    a_hash.compact
  end
end
