# @summary THIS FUNCTION IS CURRENTLY IN BETA. Puppet function to simulate imperative execution for a subset of resources by constructing iterative dependencies of each resource upon the previous resource. This thusly ensures consecutive resource application vis a vis imperative application instead of declarative.
#
# @param resources The hash of resource names and attributes, or array of resources, to construe dependencies for imperative application, and also to declare if input type is hash.
# @param type The resource type to use for declarations if $resources is hash type.
# @param defaults The hash of default attributes to use for declaration if $resources is hash type.
#
# @return Variant[Hash, Tuple] The consecutive dependency mapping with additionally resource declarations if the input type is Hash.
#
# @example Consecutively apply package resources.
#   extended_stdlib::imperative([Package['first'], Package['second'], Package['third']])
# @example Consecutively apply package resources at latest versions.
#   extended_stdlib::imperative(
#     { 'first' => {}, 'second' => {}, 'third' => {} },
#     'package',
#     { 'ensure' => 'latest' }
#   )
function extended_stdlib::imperative(
  Variant[Hash, Array[Type[Resource], 2]] $resources,
  Optional[Pattern[/^[a-z]+$/]] $type = undef,
  Optional[Hash] $defaults            = {},
) >> Variant[Hash, Tuple] {
  # differentiate behavior based on $resources data type
  case $resources {
    # construe dependencies and declare resources
    Hash: {
      # ensure type is specified for this situation
      if empty($type) {
        err("The type parameter must be specified for the imperative function if the 'resources' parameter type is 'Hash'")
      }
      # initializes resource names array
      $resource_names = keys($resources)
      # iterate through resource names and construe consecutive resource dependencies
      $resource_names.each |Integer $index, String $resource_name| {
        if $index > 0 { Resource[$type[$resource_names[$index - 1]]] -> Resource[$type[$resource_name]] }
      }

      # declare resources
      $resources.each |String $resource_title, Hash $attributes| {
        Resource[$type] {
          $resource_title: * => $attributes;
          default:         * => $defaults;
        }
      }
    }
    # construe dependencies only
    Array[Type[Resource]]: {
      # iterate through resources and construe consecutive resource dependencies
      $resources.each |Integer $index, Type[Resource] $resource| {
        if $index > 0 {
          # validate resource is declared
          if !defined($resource) {
            err("The resource ${resource} is not declared and thus cannot be used with dependency mapping for imperative application")
          }

          $resources[$index - 1] -> $resource
        }
      }
    }
    default: { fail('Puppet type checker for imperative function bypassed somehow') }
  }
}
