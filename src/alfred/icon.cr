require "json"

module Alfred
  class Icon
    include JSON::Serializable
    property type : String?
    property path : String

    def initialize
      @path = ""
    end

    def initialize(&block)
      @path = ""
      yield self
    end
  end

  enum IconType
    File
    FileIcon
    FileType

    def to_s
      # ::File omitted on purpose, as that should result in `nil`
      case self
      when FileIcon
        "fileicon"
      when FileType
        "filetype"
      end
    end
  end
end
