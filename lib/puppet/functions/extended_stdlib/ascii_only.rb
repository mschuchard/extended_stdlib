# frozen_string_literal: true

# Returns true for a string which has only ASCII characters, and false otherwise.
Puppet::Functions.create_function(:"extended_stdlib::ascii_only") do
  # @param a_string The string to determine whether it is ASCII only.
  # @param encoding The text encoding for the string.
  # @return Boolean Whether the string is ASCII only.
  # @example Returns that a string is ASCII only.
  #   ascii_only('abc') => true
  # @example Returns that a string is not ASCII only.
  #   ascii_only('abc\u{6666}') => false
  dispatch :ascii_only do
    param 'String', :a_string
    optional_param 'String', :encoding
    return_type 'Boolean'
  end

  def ascii_only(a_string, encoding = 'UTF-8')
    (+a_string).force_encoding(encoding).ascii_only?
  end
end
