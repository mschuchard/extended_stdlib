# @summary THIS FUNCTION IS CURRENTLY IN BETA. Puppet function to simulate imperative execution for a subset of resources by constructing iterative dependencies of each resource upon the previous resource. This thusly ensures consecutive resource application vis a vis imperative application instead of declarative.
#
# @param resources The array of resources to construe dependencies for imperative application.
#
# @return [Undef]
#
# @example Consecutively apply package resources.
#   extended_stdlib::imperative([Package['first'], Package['second'], Package['third']])
function extended_stdlib::imperative(Array[Resource] $resources) >> Undef {
  $resources.each |Integer $index, Resource $resource| {
    if $index > 0 {
      $resources[$index - 1] -> $resource
    }
  }
}
