# frozen_string_literal: true

# Replaces the characters in from_str with the characters in to_str. If to_str is shorter than from_str, then it is padded with its last character in order to maintain the correspondence.
Puppet::Functions.create_function(:'extended_stdlib::translate') do
  # @param a_array The string in which to replace the characters.
  # @param from_str The characters in the string to replace.
  # @param to_str The replacement characters for the string.
  # @return String The string with the characters replaced.
  # @example Replaces characters in the string 'hello'.
  #   translate('hello', 'el', 'ip') => 'hippo'
  #   translate('hello', 'aeiou', '*') => 'h*ll*'
  #   translate('hello', 'aeiou', 'AA*') => 'hAll*'
  dispatch :translate do
    param 'String', :a_string
    param 'String', :from_str
    param 'String', :to_str
    return_type 'String'
  end

  def translate(a_string, from_str, to_str)
    a_string.tr(from_str, to_str)
  end
end
