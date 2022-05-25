# frozen_string_literal: true

# Returns true if the array and other_array have at least one element in common, otherwise returns false. Will require Puppet version 8 due to Ruby >= 3.0 requirement.
Puppet::Functions.create_function(:"extended_stdlib::intersect") do
  # @param a_array The first array to determine if intersects.
  # @param other_array The second array to determine if intersects.
  # @return [Boolean] Returns whether the two arrays intersect.
  # @example Determine if first array and second array intersect.
  #   intersect([1, 2, 3], [3, 4, 5]) => true
  #   intersect([1, 2, 3], [5, 6, 7]) => false
  dispatch :intersect do
    param 'Array', :a_array
    param 'Array', :other_array
    return_type 'Boolean'
  end

  def intersect(a_array, other_array)
    if Gem::Version.new(RUBY_VERSION) >= Gem::Version.new('3.0')
      a_array.intersect?(other_array)
    else
      Puppet.warning('This function is not supported in this version of Ruby.')
      false
    end
  end
end
