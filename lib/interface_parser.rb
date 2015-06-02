require "interface_parser/version"

module InterfaceParser
  class << self
    def parse_ifconfig(command_result)
      Ifconfig.parse(command_result)
    end

    def parse_ip_addr(command_result)
      IpAddr.parse(command_result)
    end
  end
end

require "interface_parser/base"
require "interface_parser/ifconfig"
require "interface_parser/ip_addr"
