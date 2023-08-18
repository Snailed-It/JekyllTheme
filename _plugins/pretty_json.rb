require 'nokogiri'
require 'table_of_contents/configuration'
require 'table_of_contents/parser'

module Jekyll
  module PrettyJsonFilter
    def pretty_json(state = nil)
      JSON.pretty_generate(state)
    end
  end
end

Liquid::Template.register_filter(Jekyll::PrettyJsonFilter)