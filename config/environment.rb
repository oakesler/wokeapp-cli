require 'bundler/setup'
Bundler.require(:default, :development)

require_relative "../lib/a/01_model.rb"
require_relative "../lib/a/02_view.rb"
require_relative "../lib/a/03_controller.rb"

#require_relative "../lib/final/001_controller.rb"
#require_relative "../lib/final/002_current_news.rb"
#require_relative "../lib/final/003_story.rb"
#require_relative "../lib/final/004_headline.rb"
#require_relative "../lib/final/005_story_url.rb"
#require_relative "../lib/final/006_abstract.rb"


#require_all '../lib/final'

require 'nokogiri'
require 'open-uri'
require 'pry'
require "uri"