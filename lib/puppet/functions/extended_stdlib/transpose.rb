# frozen_string_literal: true

# Transposes the rows and columns in an Array of Arrays; the nested Arrays must all be the same size.
Puppet::Functions.create_function(:"extended_stdlib::transpose") do
  # @param arrays One or more equal-size Arrays of which to transpose. Issue with required_repeated_param in Puppet requires this to be nested Array.
  # @return [Array[Array]] The nested Array containing the transposition of the Arrays' elements.
  # @example Returns 1x2 transposition of 2x1 nested Array.
  #   transpose([['a0', 'a1']]) => [['a0'], ['a1']]
  # @example Returns 3x2 transposition of 2x3 nested Array.
  #   transpose([['a0', 'a1'], ['b0', 'b1'], ['c0', 'c1']]) => [['a0', 'b0', 'c0'], ['a1', 'b1', 'c1']]
  dispatch :transpose do
    required_repeated_param 'Array', :arrays
    return_type 'Array[Array]'
  end

  def transpose(arrays)
    arrays.transpose
  end
end
