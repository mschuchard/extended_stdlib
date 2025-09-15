#!/opt/puppetlabs/puppet/bin/ruby
require 'json'
require 'yaml'
require 'puppet'
require 'facter'

# read in params and shallow symbolize keys
PARAMS = JSON.parse($stdin.read).transform_keys(&:to_sym)
# set default values
PARAMS[:extension_requests] ||= {}
PARAMS[:custom_attributes] ||= {}
PARAMS[:purge_extension_requests] ||= false
PARAMS[:purge_custom_attributes] ||= false

def set_csr_attributes(extension_requests = {}, custom_attributes = {}, purge_extension_requests = false, purge_custom_attributes = false)
  # establish conf
  conf = (Facter.value(:kernel) == 'windows') ? 'C:\ProgramData\PuppetLabs\puppet\etc\csr_attributes.yaml' : '/etc/puppetlabs/puppet/csr_attributes.yaml'

  # initialize new csr attributes
  new_csr_attrs = {}

  # read in current csr attributes file and shallow symbolize keys
  raise Puppet::Error, _("CSR attributes file at #{conf} is unreadable.") unless File.readable?(conf)
  csr_attrs = YAML.safe_load(File.read(conf)).transform_keys(&:to_sym)

  # append or override extension_requests depending upon purging
  new_csr_attrs[:extension_requests] = if purge_extension_requests
    extension_requests
  else
    raise Puppet::Error, _('extension_requests must be an existing Hash') unless csr_attrs[:extension_requests].is_a?(Hash)
    csr_attrs[:extension_requests].merge(extension_requests)
  end

  # append or override custom_attributes depending upon purging
  new_csr_attrs[:custom_attributes] = if purge_custom_attributes
    custom_attributes
  else
    raise Puppet::Error, _('custom_attributes must be an existing Hash') unless csr_attrs[:custom_attributes].is_a?(Hash)
    csr_attrs[:custom_attributes].merge(custom_attributes)
  end

  # write updated csr attributes to yaml file in confdir
  raise Puppet::Error, _("CSR attributes file at #{conf} is unwritable.") unless File.writable?(conf)
  File.write(conf, YAML.dump(new_csr_attrs.transform_keys(&:to_s)))

  # construct return
  { status: 'Successfully modified CSR attributes' }
end

# main code execute
begin
  # invoke primary helper method
  result = set_csr_attributes(PARAMS[:extension_requests], PARAMS[:custom_attributes], PARAMS[:purge_extension_requests], PARAMS[:purge_custom_attributes])
  # send success results to stdout
  puts JSON.pretty_generate(result)
  exit 0
rescue Puppet::Error => err
  # send failure results to stdout
  puts(JSON.pretty_generate({ status: 'failure', error: err.message }))
  exit 1
end
