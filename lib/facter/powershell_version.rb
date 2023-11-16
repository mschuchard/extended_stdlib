require 'facter'

Facter.add(:powershell_version) do
  confine osfamily: %r{[wW]indows}
  setcode do
    raw_version = Facter::Core::Execution.execute('powershell -command $PSVersionTable.PSVersion.ToString()')
    %r{(\d+\.\d+\.\d+)}.match(raw_version)[0]
  rescue Facter::Core::Execution::ExecutionFailure
    Facter.warn 'Powershell version could not be determined and will be set to 0.0.0'
    '0.0.0'
  end
end
