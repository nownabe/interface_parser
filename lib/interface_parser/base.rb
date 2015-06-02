module InterfaceParser
  class Base
    attr_reader :command_result

    def self.parse(command_result)
      new(command_result).parse
    end

    def initialize(command_result)
      @command_result = command_result
    end

    def parse
      interfaces
    end

    def raw_interfaces
      @raw_interfaces ||= split_interfaces
    end

    private

    def beginning_of_interface
      self.class::BEGINNING_OF_INTERFACE
    end

    def split_interfaces
      interfaces = []
      interface = ""
      command_result.each_line do |line|
        if interface != "" && beginning_of_interface =~ line
          interfaces << interface
          interface = ""
        end
        interface << line unless /^$/ =~ line
      end
      interfaces << interface if interface != ""
      interfaces
    end
  end
end
