# frozen_string_literal: true

# Returns the logarithm of x. If an additional second argument is given, then it will be the logarithm base. Otherwise it is e (for the natural logarithm).
Puppet::Functions.create_function(:'extended_stdlib::log') do
  dispatch :log do
    param 'Numeric', :num
    optional_param 'Numeric', :base
    return_type 'Float'
  end
  # @param x The number of which to deteremine the logarithm.
  # @param base The optional logarithm base (default: e).
  # @return Float The logarithm of the number.
  # @example Returns logarithm.
  #   log(1) => 0.0
  #   log(12, 3) => 2.2618595071429146
  #   log(1000, 10) => 2.9999999999999996
  def log(num, base = nil)
    base.nil? ? Math.log(num) : Math.log(x, base)
  end
end
