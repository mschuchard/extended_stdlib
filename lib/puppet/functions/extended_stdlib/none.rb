# frozen_string_literal: true

# Returns a boolean of whether no elements of an array, or array or hash with a lambda block meet a given criterion. Note that the combined block input forms do not have code coverage at the moment.
Puppet::Functions.create_function(:"extended_stdlib::none") do
  # @param the_array The array containing the elements to test the criterion upon. the_hash The hash containing the entries to test the criterion upon. block The optional lambda block to specify the criterion (otherwise directly tests falsiness).
  # @return [Boolean] Returns whether no elements satisfy a conditional (i.e. every element is falsey).
  # @example Return whether no element of any array is truthy.
  #   none([undef, false]) => true
  #   none([undef, 0, false]) => false
  #   none([]) => true
  dispatch :array do
    param 'Array', :the_array
    return_type 'Boolean'
  end

  dispatch :hash_single_arg do
    param 'Hash[Any, Any]', :the_hash
    block_param 'Callable[1,1]', :block
    return_type 'Boolean'
  end

  dispatch :hash_double_arg do
    param 'Hash[Any, Any]', :the_hash
    block_param 'Callable[2,2]', :block
    return_type 'Boolean'
  end

  dispatch :enumerable_single_arg do
    param 'Iterable', :enumerable
    block_param 'Callable[1,1]', :block
    return_type 'Boolean'
  end

  dispatch :enumerable_double_arg do
    param 'Iterable', :enumerable
    block_param 'Callable[2,2]', :block
    return_type 'Boolean'
  end

  def array(the_array)
    the_array.none?
  end

  def hash_single_arg(the_hash)
    the_hash.each_pair.none? { |pair| yield(pair) }
  end

  def hash_double_arg(the_hash)
    the_hash.each_pair.none? { |pair_key, pair_value| yield(pair_key, pair_value) }
  end

  def enumerable_single_arg(enumerable)
    Puppet::Pops::Types::Iterable.asserted_iterable(self, enumerable).none? { |enum| yield(enum) }
  end

  def enumerable_double_arg(enumerable)
    enum = Puppet::Pops::Types::Iterable.asserted_iterable(self, enumerable)
    if enum.hash_style?
      enum.none? { |entry| yield(*entry) }
    else
      enum.each_with_index { |the_enum, index| return false if yield(index, the_enum) }
      true
    end
  end
end
