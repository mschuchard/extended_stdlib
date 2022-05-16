# frozen_string_literal: true

# https://github.com/puppetlabs/puppet-specifications/blob/master/language/func-api.md#the-4x-api
Puppet::Functions.create_function(:"extended_stdlib::minmax") do
  # @summary Returns a new two element Array containing the minimum and maximum values from an array of integers
  # @param [Array[Integer]] the_array The array of integers from which to return the minimum and maximum values.
  # @return [Array[Integer[2]]] Returns two element array of integers with minimum and maximum values.
  #   minmax([0, 1, 2]) => [0, 2]
  dispatch :minmax do
    param 'Array[Integer, 2]', :the_array
    return_type 'Array[Integer, 2]'
  end

  def minmax(the_array)
    the_array.minmax
  end
end
