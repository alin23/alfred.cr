require "json"

module Alfred
  class Text
    include JSON::Serializable
    property copy : String?
    property largetype : String?

    def initialize; end

    def initialize(&block)
      yield self
    end
  end
end
