# @summary THIS FUNCTION IS CURRENTLY IN BETA. Puppet function to simulate imperative execution for a subset of resources by constructing iterative dependencies of each resource upon the previous resource. This thusly ensures consecutive resource application vis a vis imperative application instead of declarative.
#
# @param resources The array of resources to construe dependencies for imperative application.
#
# @return [Undef]
#
# @example Consecutively apply package resources.
#   extended_stdlib::imperative([Package['first'], Package['second'], Package['third']])
function extended_stdlib::imperative(
  Variant[Hash, Array[Resource]] $resources,
  Regexp[/^[a-z]+$/] $type,
  Optional[Hash] $defaults = {},
) >> Undef {
  case $resources {
    Hash: {
      $resource_names = keys($resources)
      $resource_names.each |Integer $index, String $resource_name| {
        if $index > 0 { Resource[$type[$resource_names[$index - 1]]] -> Resource[$type[$resource_name]] }
      }

      $resources.each |String $resource_title, Hash $attributes| {
        Resource[$type] {
          $resource_title: * => $attributes;
          default:         * => $defaults;
        }
      }
    }
    Array: {
      $resources.each |Integer $index, Resource $resource| {
        if $index > 0 {
          $resources[$index - 1] -> $resource
        }
      }
    }
    default: { fail('Puppet type checker for imperative function bypassed somehow') }
  }
}
