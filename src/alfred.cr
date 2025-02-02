require "./alfred/*"
require "json"
require "http/client"

module Alfred
  def self.input
    ARGV.size > 0 ? ARGV[0] : ""
  end

  def self.generate_json(items : Array(Item))
    {"items" => items}.to_json
  end

  def self.output(items : Array(Item))
    puts generate_json items
  end

  def self.error(err : String)
    item = Item.new do |i|
      i.title = "Error: #{err}"
      i.subtitle = "Press ⌘L to see the full error and ⌘C to copy it."

      i.text = Text.new do |t|
        t.copy = err
        t.largetype = err
      end

      # TODO: add error icon
    end

    output item
  end

  def self.log(text : String)
    puts text if debug
  end

  def self.debug : Bool
    ENV.has_key?("alfred_debug")
  end

  # Helper overload for single items
  def self.generate_json(item : Item)
    generate_json [item]
  end

  # Helper overload for single items
  def self.output(item : Item)
    output [item]
  end
end
