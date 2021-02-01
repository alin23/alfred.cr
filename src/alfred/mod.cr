require "json"

module Alfred
  class Mod
    include JSON::Serializable
    property valid : Bool
    property arg : String
    property subtitle : String?

    def initialize
      @arg = ""
      @valid = true
    end

    def initialize(&block)
      @arg = ""
      @valid = true
      yield self
    end
  end

  enum ModKey
    Command
    Option
    Control
    CMD
    ALT
    CTRL

    def to_s
      case self
      when Command, CMD
        "cmd"
      when Option, ALT
        "alt"
      else
        "ctrl"
      end
    end
  end
end
