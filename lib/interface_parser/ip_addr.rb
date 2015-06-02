module InterfaceParser
  class IpAddr < Base
    BEGINNING_OF_INTERFACE = /^\d+:/m

    def interfaces
      @interfaces ||= raw_interfaces.inject({}) do |interfaces, raw_interface|
        /^(?<index>\d+):/ =~ raw_interface
        /loopback (?<loopback>[\w:]+)/ =~ raw_interface
        /ether (?<mac>[\w:]+)/ =~ raw_interface
        /inet (?<ipv4>[\d\.]+)(?<ipv4_prefix>\/\d\d?) brd (?<broadcast>[\d\.]+)/ =~ raw_interface
        /inet6 (?<ipv6>[\w:]+)(?<ipv6_prefix>\/\d\d?\d?)/ =~ raw_interface
        /^\d+: (?<name>[^:]+):/ =~ raw_interface

        interfaces[name] = {
          "index" => index,
          "loopback" => loopback,
          "mac" => mac,
          "ipv4" => ipv4,
          "ipv4_prefix" => ipv4_prefix,
          "broadcast" => broadcast,
          "ipv6" => ipv6,
          "ipv6_prefix" => ipv6_prefix
        }

        interfaces
      end
    end
  end
end
