# frozen_string_literal: true

# Returns a new two element Array containing the minimum and maximum values from an array of integers
Puppet::Functions.create_function(:'extended_stdlib::minmax') do
  # @param the_array The array of integers from which to return the minimum and maximum values.
  # @return [Array[Integer, 2]] Returns two element array of integers with minimum and maximum values.
  # @example Return the minimum and maximum elements of an array.
  #   minmax([0, 1, 2]) => [0, 2]
  dispatch :minmax do
    param 'Array[Integer, 2]', :the_array
    return_type 'Array[Integer, 2]'
  end

  def minmax(the_array)
    the_array.minmax
  end
end
