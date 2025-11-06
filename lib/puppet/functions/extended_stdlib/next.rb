# frozen_string_literal: true

# Returns the successor to the string. The successor is calculated by incrementing characters.
Puppet::Functions.create_function(:'extended_stdlib::next') do
  # @param a_string The string in which to return the successor.
  # @return String The next/successive string.
  # @example Increments the rightmost alphanumeric character, or the rightmost character.
  #   next('THX1138') => 'THX1139'
  #   next('<<koala>>') => '<<koalb>>'
  #   next('***') => '**+'
  # @example Increments a numeric character.
  #   next('00') => '01'
  #   next('09') => '10'
  #   next('99') => '100'
  # @example Increments an alphabetic character in the same case.
  #   next('aa') => 'ab'
  #   next('az') => 'ba'
  #   next('zz') => 'aaa'
  dispatch :next do
    param 'String', :a_string
    return_type 'String'
  end

  def next(a_string)
    a_string.succ
  end
end
