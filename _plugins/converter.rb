require 'rbst'

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
      RbST.python_path = "/usr/bin/env python3"
      RbST.executables = {:html => "#{File.expand_path(File.dirname(__FILE__))}/rst2html5.py"}
      RbST.convert(content)
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