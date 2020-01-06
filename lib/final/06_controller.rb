require_relative "../config/environment"

class Controller
  
  attr_accessor :news_hash
  
  def initialize(news_hash)
    CurrentNews.new(news_hash)
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
		  story_selector
		  elsif input == "random"
	  	randomizer
	  else
		  welcome_menu
		end
  end 
  
  
end






def aclu_object_maker
  aclu_story = Story.new("ACLU", "www.aclu.org")
  aclu_story.headline = the_aclu_headline_scraper
  aclu_story.story_url = the_aclu_url_scraper
  aclu_story.abstract = the_aclu_abstract_scraper
  @story_hash[:ACLU] = aclu_story
end

def amnesty_object_maker 
  amnesty_story = Story.new("Amnesty International USA", "www.amnestyusa.org")
  amnesty_story.headline = the_amnesty_headline_scraper
  amnesty_story.story_url = the_amnesty_url_scraper
  amnesty_story.abstract = the_amnesty_abstract_scraper
  @story_hash[:Amnesty] = amnesty_story
end

def hrw_object_maker
  hrw_story = Story.new("Human Rights Watch", "www.hrw.org")
  hrw_story.headline = the_hrw_headline_scraper
  hrw_story.story_url = the_hrw_url_scraper
  hrw_story.abstract = the_hrw_abstract_scraper
  @story_hash[:HRW] = hrw_story
end

def splc_object_maker
  splc_story = Story.new("Southern Poverty Law Center", "www.splcenter.org")
  splc_story.headline = the_splc_headline_scraper
  splc_story.story_url = the_splc_url_scraper
  splc_story.abstract = the_splc_abstract_scraper
  @story_hash[:SPLC] = splc_story
end

#def scrape_executor
  #puts "Welcome to WokeApp!  Please wait a few moments for today's news..."
  #aclu_object_maker
  #amnesty_object_maker
  #hrw_object_maker
  #splc_object_maker
  #welcome_menu
#end

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
		story_selector
		elsif input == "random"
		randomizer
		else
		  welcome_menu
		end
  end 

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

def story_selector
  puts "                         "
  puts "Please select a headline by number (1-4)"
  puts "                                         "
  puts "1. #{@story_hash[:ACLU].headline}"
  puts "2. #{@story_hash[:Amnesty].headline}"
  puts "3. #{@story_hash[:HRW].headline}"
  puts "4. #{@story_hash[:SPLC].headline}"
  puts "                                        "
  puts "...or type 'back' to return to menu"
  puts "                           "
  input = gets.strip
  if input == "1"
    aclu_story_display
    elsif input == "2"
    amnesty_story_display
    elsif input == "3"
    hrw_story_display
    elsif input == "4"
    splc_story_display
    elsif input == "back"
    story_selector
  else 
    menu_redirect
  end
end

def randomizer
  sample_array = [1, 2, 3, 4]
  x = sample_array.sample
  if x == 1
    aclu_story_display
    elsif x == 2
    amnesty_story_display
    elsif x == 3
    hrw_story_display
    elsif x == 4
    splc_story_display
  else 
    story_selector
  end
end
