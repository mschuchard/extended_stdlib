# @summary Manages a script's existence in the directory of a system, and then executes the script if the script's attributes changed.
#
# Manages a script's existence in the directory of a system, and then executes the script if the script's attributes changed.
#
# @example Manages a script named 'myscript.sh' on the target system and sourced from the containing module, and then executes the script with the default shell interpreter.
#   extended_stdlib::script { 'myscript.sh': }
#
# @param script
#   The filename of the script to be managed and executed. Defaults to the title of the resource.
# @param module
#   The module containing the script. Defaults to the module where this resource is declared.
# @param shell_path
#   The path to the shell interpreter executable used for executing the managed script file.
# @param stage_dir
#   The path to the staging directory for managing the script file on the target system prior to execution.
# @param source_file
#   The filename of the source script file. Templates are handled automatically. Defaults to the script param.
# @param file_attr
#   A hash of additional attribute => value pairs to append to the file resource that manages the script.
# @param exec_attr
#   A hash of additional attribute => value pairs to append to the exec resource that execures the script.
define extended_stdlib::script (
  String $script      = $title,
  String $module      = $caller_module_name,
  String $shell_path  = '/bin/sh',
  String $stage_dir   = '/tmp',
  String $source_file = $script,
  Hash $file_attr     = {},
  Hash $exec_attr     = {}
) {
  # manage script file
  file { "${stage_dir}/${script}":
    ensure => file,
    *      => $file_attr,
  }
  # manage content as erb template
  if extended_stdlib::end_with($source_file, ['.erb']) {
    File["${stage_dir}/${script}"] { content => template("${module}/${source_file}") }
  }
  # manage content as static source
  else {
    File["${stage_dir}/${script}"] { source => "puppet:///modules/${module}/${source_file}" }
  }

  # execute script
  exec { "execute ${script} with ${shell_path}":
    command     => "${shell_path} /tmp/${script}",
    subscribe   => File["${stage_dir}/${script}"],
    refreshonly => true,
    *           => $exec_attr,
  }
}
