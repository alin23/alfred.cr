require "json"

module Alfred
  class ComplexArg
    include JSON::Serializable

    property arg : String?
    property variables : Hash(String, String)?

    def initialize; end

    def initialize(&block)
      yield self
    end
  end
end
