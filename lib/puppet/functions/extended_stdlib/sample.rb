# frozen_string_literal: true

# Returns random elements from an Array. Note that the return is non-deterministic.
Puppet::Functions.create_function(:'extended_stdlib::sample') do
  # @param the_array The Array from which to select random elements.
  # @param num_elements The non-negative number of random elements to select from the Array. This must be less than or equal to the size of the Array. If not provided, then a single random element is returned.
  # @return [Variant[Array, Any]] The random element or Array of random elements selected from the Array.
  # @example Return a random element from an Array.
  #   sample([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]) => 3
  # @example Return multiple random elements from an Array.
  #   sample([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 3) => [8, 9, 2]
  #   sample([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 6) => [9, 6, 10, 3, 1, 4]
  dispatch :sample do
    param 'Array[1]', :the_array
    optional_param 'Integer', :num_elements
    return_type 'Variant[Array, Any]'
  end

  def sample(the_array, num_elements = nil)
    if num_elements
      raise Puppet::Error, _('Number of elements must be a non-negative number') if num_elements.negative?
      raise Puppet::Error, _('Number of elements must be less than or equal to the size of the Array') if num_elements > the_array.size
      the_array.sample(num_elements)
    else
      the_array.sample
    end
  end
end
