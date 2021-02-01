require "json"

module Alfred
  class AlfredWorkflow
    include JSON::Serializable

    property arg : String?
    property variables : Hash(String, String)?

    def initialize; end

    def initialize(&block)
      yield self
    end
  end

  class ComplexArg
    include JSON::Serializable

    property alfredworkflow : AlfredWorkflow = AlfredWorkflow.new
    forward_missing_to @alfredworkflow

    def initialize; end

    def initialize(&block)
      yield self
    end
  end
end
