# frozen_string_literal: true

# Returns integer truncated (toward zero) to a precision of num_digits decimal points. When num_digits is negative, the returned value has at least abs(num_digits) trailing zeros. Returns same integer when num_digits is zero or positive.
Puppet::Functions.create_function(:'extended_stdlib::truncate') do
  dispatch :truncate do
    param 'Integer', :a_integer
    optional_param 'Integer', :num_digits
    return_type 'Integer'
  end
  # @param a_integer The integer to truncate.
  # @param num_digits The optional number of digits to truncate the integer (default: 0).
  # @return Integer The new integer after truncation to num_digits.
  # @example Returns truncated integer.
  #   truncate(555, -1) => 550
  #   truncate(555, -2) => 500
  #   truncate(-555, -2) => -500
  # @example Returns same integer.
  #   truncate(555) => 555
  #   truncate(555, 50) => 555
  def truncate(a_integer, num_digits = nil)
    num_digits ? a_integer.truncate(num_digits) : a_integer.truncate
  end
end
