# frozen_string_literal: true

# Returns an Array containing all but the first num element of the array, where num is a non-negative Integer
Puppet::Functions.create_function(:'extended_stdlib::drop') do
  # @param the_array The array to remove the first num elements from.
  # @param num The number of first elements to remove from the array.
  # @return [Array] Returns the array with the first num elements removed.
  # @example Remove the first 0, 1, or 2 elements from an array, and return that array.
  #   drop([0, 1, 2, 3, 4, 5], 0) => [0, 1, 2, 3, 4, 5]
  #   drop([0, 1, 2, 3, 4, 5], 1) => [1, 2, 3, 4, 5]
  #   drop([0, 1, 2, 3, 4, 5], 2) => [2, 3, 4, 5]
  dispatch :drop do
    param 'Array', :the_array
    param 'Integer', :num
    return_type 'Array'
  end

  def drop(the_array, num)
    raise Puppet::Error, _('Number of elements must be a non-negative integer') if num.negative?
    the_array.drop(num)
  end
end
