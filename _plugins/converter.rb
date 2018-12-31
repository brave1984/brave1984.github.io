module Jekyll
  class RstConverter < Converter
    safe true
    priority :low

    def matches(ext)
      ext =~ /rst/i
    end

    def output_ext(ext)
      ".html"
    end

    def convert(content)
      IO.popen("python3 #{File.expand_path(File.dirname(__FILE__))}/rst2html5.py", 'r+') do |pipe|
        pipe.puts(content)
        pipe.close_write
        result = pipe.read
        pipe.close_read
        result
      end
    end
  end

  module Filters
    def rst(input)
      site = @context.registers[:site]
      converter = site.find_converter_instance(::Jekyll::Converters::RstConverter)
      converter.convert(input)
    end
  end
end