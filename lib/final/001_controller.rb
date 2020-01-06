require_relative "../config/environment"

require 'nokogiri'
require 'open-uri'
require 'pry'
require "uri"

class Controller
  
  attr_accessor :news_hash, :current_news
  
  def initialize(news_hash)
    @news_hash = news_hash
    @current_news = CurrentNews.new(news_hash)
  end
  
  def welcome_menu
    puts "                                      "
    puts "Select by story or use our randomizer."
	  puts "For story selection, type ‘story'"
	  puts "For randomizer, type ‘random'"
	  puts "To exit, type ‘exit’"
	  puts "                                     "
	  input = gets.strip
	  if input == "exit"
		  puts "Thanks for using WokeApp!"
		  puts "       "
		  puts "Questions? Comments? Email the WokeApp team at o.a.koenig@gmail.com"
		  elsif input == "story"
		  headline_display
		  elsif input == "random"
	  	randomizer
	  else
		  welcome_menu
		end
  end 
  
  def headline_display
    puts "                         "
    puts "Please select a headline by number (1-4)"
    puts "                                         "
    puts "1. #{@current_news.source_one.headline}"
    puts "2. #{@current_news.source_two.headline}"
    puts "3. #{@current_news.source_three.headline}"
    puts "4. #{@current_news.source_four.headline}"
    puts "                                        "
    puts "...or type 'back' to return to menu"
    puts "                           "
    input = gets.strip
    if input == "1"
      @current_news.source_one.display
      elsif input == "2"
      @current_news.source_two.display
      elsif input == "3"
      @current_news.source_three.display
      elsif input == "4"
      @current_news.source_four.display
      elsif input == "back"
      headline_display
    else 
      welcome_menu
    end
  end

def randomizer
  sample_array = [1, 2, 3, 4]
  x = sample_array.sample
  if x == 1
    @current_news.story_one.display
    elsif x == 2
    @current_news.story_one.display
    elsif x == 3
    @current_news.story_one.display
    elsif x == 4
    @current_news.story_one.display
  else 
    headline_selector
  end
end
  
  
end


###############################################################################

def aclu_story_display
  puts "                      "
  puts "#{@story_hash[:ACLU].source} (#{@story_hash[:ACLU].home_url})"
  puts "                          "
  puts "------------------------------------------"
  puts "#{@story_hash[:ACLU].headline}"
  puts "------------------------------------------"
  puts "                            "
  puts "#{@story_hash[:ACLU].abstract}"
  puts "                             "
  puts "Continue reading at"
  puts "#{@story_hash[:ACLU].story_url}"
  puts "                                 "
  welcome_menu
end

def amnesty_story_display
  puts "                          "
  puts "#{@story_hash[:Amnesty].source} (#{@story_hash[:Amnesty].home_url})"
  puts "------------------------------------------"
  puts "#{@story_hash[:Amnesty].headline}"
  puts "------------------------------------------"
  puts "                               "
  puts "#{@story_hash[:Amnesty].abstract}"
  puts "              "
  puts "Continue reading at..."
  puts "#{@story_hash[:Amnesty].story_url}"
  puts "                    "
  welcome_menu
end

def hrw_story_display
  puts "                           "
  puts "#{@story_hash[:HRW].source} (#{@story_hash[:HRW].home_url})"
  puts "------------------------------------------"
  puts "#{@story_hash[:HRW].headline}"
  puts "------------------------------------------"
  puts "                                 "
  puts "#{@story_hash[:HRW].abstract}"
  puts "    "
  puts "Continue reading at ..." 
  puts "#{@story_hash[:HRW].story_url}"
  puts "           "
  welcome_menu
end

def splc_story_display
  puts "                             "
  puts "#{@story_hash[:SPLC].source} (#{@story_hash[:SPLC].home_url})"
  puts "------------------------------------------"
  puts "#{@story_hash[:SPLC].headline}"
  puts "------------------------------------------"
  puts "                               "
  puts "#{@story_hash[:SPLC].abstract}"
  puts "                               "
  puts "Continue reading at..."
  puts "#{@story_hash[:SPLC].story_url}"
  puts "                          "
  welcome_menu
end


