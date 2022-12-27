# frozen_string_literal: true

# Returns true if the string starts with one of the prefixes given. Each prefix should be a String or (Ruby >= 2.5) Regexp.
Puppet::Functions.create_function(:"extended_stdlib::start_with") do
  # @param a_string The string to check if it begins with one of the given prefixes.
  # @param prefixes The prefixes to check for if the string begins.
  # @return Boolean Whether or not the string begins with one of the given prefixes.
  # @example Check if the string begins with one String prefix.
  #   start_with('hello', ['hell']) => true
  # @example Check if the string begins with one Regexp prefix.
  #   start_with('hello', [/h/]) => true
  # @example Check if the string begins with one of the prefixes.
  #   start_with('hello', ['heaven', 'hell']) => true
  #   start_with('hello', ['heaven', 'paradise']) => false
  dispatch :start_with do
    param 'String', :a_string
    required_repeated_param 'Array[Variant[String, Regexp]]', :prefixes
    return_type 'Boolean'
  end

  def start_with(a_string, prefixes)
    # any?(Regexp) coincidentally also only ruby >= 2.5
    if prefixes.any? { |prefix| prefix.instance_of?(Regexp) } && Gem::Version.new(RUBY_VERSION) < Gem::Version.new('2.5')
      Puppet.warning('Regular expression prefixes are not supported in Ruby prior to version 2.5.')
      false
    else
      a_string.start_with?(*prefixes)
    end
  end
end
