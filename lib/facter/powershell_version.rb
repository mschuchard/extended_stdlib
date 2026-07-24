require 'facter'

Facter.add(:powershell_version) do
  confine osfamily: %r{[wW]indows}
  setcode do
    # determine powershell version
    raw_version = Facter::Core::Execution.execute('powershell -command $PSVersionTable.PSVersion.ToString()')
    version = %r{(\d+\.\d+\.\d+)}.match(raw_version)[0] if !raw_version.nil?

    # validate powershell version
    if version.nil?
      Facter.warn 'Powershell version could not be determined and will be set to 0.0.0'
      '0.0.0'
    end
    version
  rescue Facter::Core::Execution::ExecutionFailure
    Facter.warn 'Powershell version could not be determined and will be set to 0.0.0'
    '0.0.0'
  end
end
