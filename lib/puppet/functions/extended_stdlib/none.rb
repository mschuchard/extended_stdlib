# frozen_string_literal: true

# Returns a boolean of whether no elements of an array, or array or hash with a lambda block meet a given criterion. Note that the combined block input forms do not have code coverage at the moment.
Puppet::Functions.create_function(:"extended_stdlib::none") do
  # @param the_array The array containing the elements to test the criterion upon. the_hash The hash containing the entries to test the criterion upon. block The optional lambda block to specify the criterion (otherwise directly tests falsiness).
  # @return [Boolean] Returns whether no elements satisfy a conditional (i.e. every element is falsey).
  # @example Return whether no element of any array is truthy.
  #   none([undef, false]) => true
  #   none([undef, 0, false]) => false
  #   none([]) => true
  dispatch :none_Array do
    param 'Array', :the_array
    return_type 'Boolean'
  end

  dispatch :none_Hash_2 do
    param 'Hash[Any, Any]', :the_hash
    block_param 'Callable[2,2]', :block
    return_type 'Boolean'
  end

  dispatch :none_Hash_1 do
    param 'Hash[Any, Any]', :the_hash
    block_param 'Callable[1,1]', :block
    return_type 'Boolean'
  end

  dispatch :none_Enumerable_2 do
    param 'Iterable', :enumerable
    block_param 'Callable[2,2]', :block
    return_type 'Boolean'
  end

  dispatch :none_Enumerable_1 do
    param 'Iterable', :enumerable
    block_param 'Callable[1,1]', :block
    return_type 'Boolean'
  end

  def none_Array(the_array)
    the_array.none?
  end

  def none_Hash_1(the_hash)
    the_hash.each_pair.none? { |x| yield(x) }
  end

  def none_Hash_2(the_hash)
    the_hash.each_pair.none? { |x, y| yield(x, y) }
  end

  def none_Enumerable_1(enumerable)
    Puppet::Pops::Types::Iterable.asserted_iterable(self, enumerable).none? { |e| yield(e) }
  end

  def none_Enumerable_2(enumerable)
    enum = Puppet::Pops::Types::Iterable.asserted_iterable(self, enumerable)
    if enum.hash_style?
      enum.none? { |entry| yield(*entry) }
    else
      enum.each_with_index { |e, i| return false if yield(i, e) }
      true
    end
  end
end
