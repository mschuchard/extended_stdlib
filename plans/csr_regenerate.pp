# This plan modifies the CSR attributes on servers, and then regenerates the client certificate on the servers to enable PuppetDB to update the values from the CSR attributes.
# @param servers The servers to target for CSR attribute modification.
# @param puppet_orchestrator The server hosting the Puppet Orchestrator software for executing plans and tasks.
# @param extension_requests The desired extensions requests in the CSR attributes.
# @param custom_attributes The desired custom attributes in the CSR attributes.
# @param purge_extension_requests Whether or not to purge the existing extension requests in the CSR attributes when updating.
# @param purge_custom_attributes Whether or not to purge the existing custom attributes in the CSR attributes instead when updating.
plan extended_stdlib::csr_regenerate(
  TargetSpec $servers,
  TargetSpec $puppet_orchestrator,
  Hash $extension_requests          = {},
  Hash $custom_attributes           = {},
  Boolean $purge_extension_requests = false,
  Boolean $purge_custom_attributes  = false,
) {
  # determine puppet_orchestrator target
  $orchestrator = get_target($puppet_orchestrator)

  # execute csr update and cert regene
  get_targets($servers).each |Target $server| {
    background() || {
      # update csr attributes
      run_task(
        'extended_stdlib::csr_attributes',
        $server,
        "updating csr attributes on ${server}",
        'extension_requests'       => $extension_requests,
        'custom_attributes'        => $custom_attributes,
        'purge_extension_requests' => $purge_extension_requests,
        'purge_custom_attributes'  => $purge_custom_attributes,
      )

      # regenerate client certificate
      run_command("puppet infrastructure run regenerate_agent_certificate agent=${server}", $orchestrator, "regenerate client certificate on ${server}")
    }
  }
  # aggregate results
  $csr_return = wait()

  # return results
  return $csr_return
}
