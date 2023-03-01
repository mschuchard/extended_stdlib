# frozen_string_literal: true

# Returns e**x.
Puppet::Functions.create_function(:'extended_stdlib::exp') do
  dispatch :exp do
    param 'Numeric', :x
    return_type 'Float'
  end
  # @param x The number of which to deteremine the exponential.
  # @return Float The non-negative exponential of the number.
  # @example Returns exponential.
  #   sqrt(0) => 1.0
  #   sqrt(1) => 2.718281828459045
  #   sqrt(1.5) => 4.4816890703380645
  def exp(x)
    Math.exp(x)
  end
end
