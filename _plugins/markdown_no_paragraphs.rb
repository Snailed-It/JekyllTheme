require 'nokogiri'
require 'table_of_contents/configuration'
require 'table_of_contents/parser'

module Jekyll
  module MarkdownNoParagraphs
    def markdown_no_paragraphs(input = nil)
      @context.registers[:site].find_converter_instance(
              Jekyll::Converters::Markdown
            ).convert(input.to_s).gsub("<p>", "").gsub("</p>", "")
    end
  end
end

Liquid::Template.register_filter(Jekyll::MarkdownNoParagraphs)