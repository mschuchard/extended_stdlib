# frozen_string_literal: true

# Returns true if the string ends with one of the suffixes given.
Puppet::Functions.create_function(:'extended_stdlib::end_with') do
  # @param a_string The string to check if it ends with one of the given suffixes.
  # @param suffixes The suffixes to check for if the string ends.
  # @return Boolean Whether or not the string ends with one of the given suffixes.
  # @example Check if the string ends with one suffix.
  #   end_with('hello', ['ello']) => true
  # @example Check if the string ends with one of the suffixes.
  #   end_with('hello', ['heaven', 'ello']) => true
  #   end_with('hello', ['heaven', 'paradise']) => false
  dispatch :end_with do
    param 'String', :a_string
    required_repeated_param 'Array[String]', :suffixes
    return_type 'Boolean'
  end

  def end_with(a_string, suffixes)
    a_string.end_with?(*suffixes)
  end
end
