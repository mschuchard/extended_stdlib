# frozen_string_literal: true

# https://github.com/puppetlabs/puppet-specifications/blob/master/language/func-api.md#the-4x-api
Puppet::Functions.create_function(:"extended_stdlib::hash_subset") do
  # returns a boolean of whether the first hash is a subset of the second hash
  # @param [Hash] hash The hash to determine if this hash is a subset of other_hash.
  # @param [Hash] other_hash The hash to determine if hash is a subset of this hash.
  # @optional_param [Boolean] proper Specifies if the subset determination should be for a proper subset or regular subset.
  # @return [Boolean] Returns whether hash is a subset of other_hash.
  # @example Determine if hash is subset of other_hash.
  #   hash_subset({'foo' => 0, 'bar' => 1}, {'foo' => 0, 'bar' => 1, 'baz' => 2}) => true
  #   hash_subset({'foo' => 0, 'bar' => 1, 'baz' => 2}, {'foo' => 0, 'bar' => 1}) => false
  #   hash_subset({'foo' => 0, 'bar' => 1}, {'foo' => 0, 'bar' => 1}) => true
  #   hash_subset({'foo' => 0, 'bar' => 1}, {'foo' => 0, 'bar' => 1}, true) => false
  dispatch :subset do
    param 'Hash', :hash
    param 'Hash', :other_hash
    optional_param 'Boolean', :proper
    return_type 'Boolean'
  end

  def subset(hash, other_hash, proper = false)
    proper ? hash < other_hash : hash <= other_hash
  end
end
