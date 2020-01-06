require_relative "../config/environment"

require 'nokogiri'
require 'open-uri'
require 'pry'
require "uri"

class CurrentNews
  
  attr_accessor :source_one, :source_two, :source_three, :source_four
  
  def initialize(news_hash)
    @source_one = Story.new(news_hash[:source_one])
    @source_two = Story.new(news_hash[:source_two])
    @source_three = Story.new(news_hash[:source_three])
    @source_four = Story.new(news_hash[:source_four])
  end
end
