# frozen_string_literal: true

# Centers a string in width. If the width is greater than the length of the string, then the string is centered by padding and padded with padstring; otherwise the string is returnd.
Puppet::Functions.create_function(:"extended_stdlib::center") do
  # @param a_string The string to center in width with the pad_string.
  # @param width The width of the resultant padded string.
  # @param pad_string The optional string to use for the surrounding padding.
  # @return String The resultant apdded string.
  # @example Returns the string since width is smaller than the string.
  #   center('hello', 4) => 'hello'
  # @example Returns the centered string padded with empty string.
  #   center('hello', 20) => '       hello       '
  # @example Returns the centered string padded with '#-'.
  #   center('hello', 20, '#-') => '#-#-#-#hello#-#-#-#'
  dispatch :center do
    param 'String', :a_string
    param 'Integer', :width
    optional_param 'String', :pad_string
    return_type 'String'
  end

  def center(a_string, width, pad_string = nil)
    pad_string ? a_string.center(width, pad_string) : a_string.center(width)
  end
end
