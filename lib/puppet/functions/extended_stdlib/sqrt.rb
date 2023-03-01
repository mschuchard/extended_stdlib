# frozen_string_literal: true

# Returns the non-negative square root of x.
Puppet::Functions.create_function(:'extended_stdlib::sqrt') do
  dispatch :sqrt do
    param 'Numeric', :x
    return_type 'Float'
  end
  # @param x The number of which to deteremine the square root.
  # @return Integer The non-negative square root of the number.
  # @example Returns square root.
  #   sqrt(4) => 2.0
  #   sqrt(2) => 1.4142135623731
  #   sqrt(9) => 3.0
  def sqrt(x)
    Math.sqrt(x)
  end
end
