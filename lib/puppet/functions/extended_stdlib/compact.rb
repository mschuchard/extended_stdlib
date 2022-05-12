# frozen_string_literal: true

# https://github.com/puppetlabs/puppet-specifications/blob/master/language/func-api.md#the-4x-api
Puppet::Functions.create_function(:"extended_stdlib::compact") do
  # Returns a hash or array with all of the undef value entries removed
  # @param [Variant[Hash, Array]] hash_or_array The hash or array from which to remove the undef value entries.
  # @return [Variant[Hash, Array]] The hash or array with all of the undef value entries removed.
  # @example Input a hash and return it compacted.
  #   compact({'foo' => 0, 'bar' => undef, 'baz' => 2, 'bat' => undef}) => {'foo' => 0, 'baz' => 2}
  # @example Input an array and return it compacted.
  #   compact([undef, 0, undef, 1, undef, 2, undef]) => [0, 1, 2]
  dispatch :compact do
    param 'Variant[Hash, Array]', :hash_or_array
    return_type 'Variant[Hash, Array]'
  end

  def compact(hash_or_array)
    hash_or_array.compact
  end
end
