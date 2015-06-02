module InterfaceParser
  class Ifconfig < Base
    BEGINNING_OF_INTERFACE = /^[^\s]+:\s/m

    def interfaces
      @interfaces ||= raw_interfaces.inject({}) do |interfaces, raw_interface|
        interfaces[get_name(raw_interface)] = {
          "ipv4" => get_ipv4(raw_interface),
          "netmask" => get_netmask(raw_interface),
          "broadcast" => get_broadcast(raw_interface),
          "ipv6" => get_ipv6(raw_interface),
          "mac" => get_mac(raw_interface)
        }

        interfaces
      end
    end

    private

    def get_broadcast(raw_interface)
      /broadcast (?<broadcast>[\d\.]+)/ =~ raw_interface
      broadcast
    end

    def get_ipv4(raw_interface)
      /inet (?<ipv4>[\d\.]+)/ =~ raw_interface
      ipv4
    end

    def get_ipv6(raw_interface)
      /inet6 (?<ipv6>[\w:%]+)/ =~ raw_interface
      ipv6
    end

    def get_mac(raw_interface)
      /ether (?<mac>[\w:]+)\s/ =~ raw_interface
      mac
    end

    def get_netmask(raw_interface)
      /netmask (?<netmask>[\d\.xa-f]+)/ =~ raw_interface
      netmask
    end

    def get_name(raw_interface)
      /^(?<name>[^\s]+):/ =~ raw_interface
      name
    end
  end
end
