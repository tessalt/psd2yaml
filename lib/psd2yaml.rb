require "psd2yaml/version"
require "yaml"
require "psd"

module Parser
  class Psd2yaml

    def initialize(input, output) 
      @output_file = output || File.basename(input, ".*") << ".yml"
      @psd = PSD.new(input)   
    end

    def parse
      output = Hash.new
      @psd.parse! 
      @psd.tree.descendant_layers.each do |layer|
        unless layer.text.nil? 
          text = layer.text[:value].gsub(/\r?\n/, " ").split.join(" ")
          key = layer.name.downcase.gsub(/[^a-z0-9\s]/i, "").split.join("_")
          output[key] = text
        end
      end

      File.open(@output_file, "w") {|f| f.write(output.to_yaml line_width: -1)}

      puts "Created file #{@output_file}"

    end

  end

end