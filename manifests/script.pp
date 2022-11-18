# @summary Manages a script's existence in the directory of a system, and then executes the script if the script's attributes changed.
#
# Manages a script's existence in the directory of a system, and then executes the script if the script's attributes changed.
#
# @example Manages a script named 'myscript.sh' on the target system and sourced from the containing module, and then executes the script with the shell interpreter.
#   extended_stdlib::script { 'myscript.sh': }
#
# @param script
#   The filename of the script to be managed and executed. Defaults to the title of the resource.
# @param module
#   The module containing the script. Defaults to the module where this resource is declared.
# @param file_attr
#   A hash of additional attribute => value pairs to append to the file resource that manages the script.
# @param exec_attr
#   A hash of additional attribute => value pairs to append to the exec resource that execures the script.
define extended_stdlib::script (
  String $script  = $title,
  String $module  = $caller_module_name,
  Hash $file_attr = {},
  Hash $exec_attr = {})
{
  file { "/tmp/${script}":
    ensure => file,
    source => "puppet:///modules/${module}/${script}",
    *      => $file_attr,
  }

  exec { "/bin/sh /tmp/${script}":
    subscribe   => File["/tmp/${script}"],
    refreshonly => true,
    *           => $exec_attr,
  }
}
