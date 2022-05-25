# frozen_string_literal: true

# Computes and returns all combinations of elements from all of the Arrays
Puppet::Functions.create_function(:"extended_stdlib::product") do
  # @param arrays One or more Arrays of which to compute the products. Issue with required_repeated_param in Puppet requires this to be nested Array.
  # @return [Array[Array]] The nested Array containing the product of the Arrays' elements.
  # @example Returns original Array if only one is specified.
  #   product([[0, 1, 2]]) => [[0, 1, 2]]
  # @example Return the product of two Arrays.
  #   product([[0, 1, 2], [3, 4]]) => [[0, 3], [0, 4], [1, 3], [1, 4], [2, 3], [2, 4]]
  # @example Return the product of three Arrays.
  #   product([[0, 1, 2], [3, 4], [5, 6]]) => [[0, 3, 5], [0, 3, 6], [0, 4, 5], [0, 4, 6], [1, 3, 5], [1, 3, 6], [1, 4, 5], [1, 4, 6], [2, 3, 5], [2, 3, 6], [2, 4, 5], [2, 4, 6]]
  dispatch :product do
    required_repeated_param 'Array', :arrays
    return_type 'Array[Array]'
  end

  def product(arrays)
    if arrays.length == 1
      arrays
    else
      arrays[0].product(*arrays[1...])
    end
  end
end
