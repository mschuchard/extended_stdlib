require 'facter'

Facter.add(:subnet) do
  setcode do
    # store ipv4 address fact
    ip_addr = Facter.value(:networking)['ip']

    # determine subnet if the ipv4 address is valid
    if ip_addr.match?(%r{[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+}) then
      %r{([0-9]+\.[0-9]+\.[0-9]+)\.[0-9]+}.match(ip_addr).captures[0]
    else
      Facter.warn('Something is wrong with the system ipv4 address. Verify the networking.ip fact for further details.')
      'unknown'
    end
  end
end
