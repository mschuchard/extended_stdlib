# frozen_string_literal: true

# Returns the sum of an optional summand with all elements of an Array.
Puppet::Functions.create_function(:'extended_stdlib::sum') do
  # @param the_array The array to sum with an optional summand.
  # @param summand The optional summand to sum with the Array elements.
  # @return Variant[Numeric, String] The sum of the optional summand with the Array elements.
  # @example Returns sum of Array of Integers.
  #   sum([0, 1, 2, 3]) => 6
  # @example Returns sum of Integer and Array of Integers.
  #   sum([0, 1, 2, 3], 100) => 106
  # @example Returns sum of String and Array of Strings.
  #   sum(['abc', 'def', 'ghi'], 'jkl') => 'jklabcdefghi'
  dispatch :sum do
    param 'Array[Variant[Numeric, String]]', :the_array
    optional_param 'Variant[Numeric, String]', :summand
    return_type 'Variant[Numeric, String]'
  end

  def sum(the_array, summand = nil)
    summand ? the_array.sum(summand) : the_array.sum
  end
end
