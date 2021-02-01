require "json"

module Alfred
  class Item
    include JSON::Serializable
    property uid : String?
    property title : String
    property subtitle : String?
    property match : String?
    property arg : String | ComplexArg?
    property icon : Icon?
    property valid : Bool?
    property autocomplete : String?
    property type : String?
    property mods : Hash(String, Mod)?
    property text : Text?
    property quicklookurl : String?

    def initialize
      @title = ""
    end

    def initialize(&block)
      @title = ""
      yield self
    end

    def add_mod(key : ModKey, mod : Mod)
      mods = @mods
      if mods.nil?
        mods = {key.to_s => mod}
      else
        mods[key.to_s] = mod
      end
      @mods = mods
    end
  end

  enum ItemType
    Default
    File
    FileSkipCheck

    def to_s
      case self
      when Default
        "default"
      when File
        "file"
      when FileSkipCheck
        "file:skipcheck"
      end
    end
  end
end
