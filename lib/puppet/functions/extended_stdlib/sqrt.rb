# frozen_string_literal: true

# Returns the non-negative square root of a number.
Puppet::Functions.create_function(:'extended_stdlib::sqrt') do
  dispatch :sqrt do
    param 'Numeric', :num
    return_type 'Float'
  end
  # @param num The non-negative number of which to determine the square root.
  # @return Float The non-negative square root of the number.
  # @example Returns square root.
  #   sqrt(4) => 2.0
  #   sqrt(2) => 1.4142135623731
  #   sqrt(9) => 3.0
  def sqrt(num)
    raise Puppet::Error, _('Input must be a non-negative number') if num.negative?
    Math.sqrt(num)
  end
end
