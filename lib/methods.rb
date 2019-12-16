require_relative "../config/environment.rb"
require "/home/oakesler/Development/wokeapp-cli/lib/story_object.rb"
require 'nokogiri'
require 'open-uri'
require 'pry'

@story_hash = {:ACLU => " " , :Amnesty => " ", :HRW => " " , :SPLC => " ", :Backup => " "}


def the_aclu_headline_scraper
  html_aclu = open("https://www.aclu.org")
  doc_aclu = Nokogiri::HTML(html_aclu)
  step_1 = doc_aclu.css("div#hp__top_spotlight")
  headline_aclu = step_1.css("div")[4].children[0].text.strip
  backup_headline = doc_aclu.css('span.is-uppercase').text
  error_headline = "Sorry, still waiting on headline from ACLU.org..."
  if !headline_aclu.scan(/\w/) && !!backup_headline.scan(/\w/)
    backup_headline
    elsif !!headline_aclu.scan(/\w/)
    headline_aclu
  else 
    error_headline
  end
end

def the_amnesty_headline_scraper
  html_amnesty = open("https://www.amnesty.org/en/")
  doc_amnesty = Nokogiri::HTML(html_amnesty)
  headline_amnesty = "#{doc_amnesty.css('span.heading--tape').text}: #{doc_amnesty.css('p.image-headline__copy').text}"
  error_headline = "Sorry, still waiting on headline from Amnesty International USA"
  if headline_amnesty.scan(/\w/)
    headline_amnesty
  else
    error_headline
  end
end

def the_hrw_headline_scraper
  html_hrw = open("https://www.hrw.org/#")
  doc_hrw = Nokogiri::HTML(html_hrw)
  headline_hrw = doc_hrw.css('h3.billboard-title').text
  error_headline = "Sorry, still waiting on headline from Human Rights Watch..."
  if !!headline_hrw.scan(/\w/)
    headline_hrw
  else
    error_headline
  end
end

def the_splc_headline_scraper
  html_splc = open("https://www.splcenter.org")
  doc_splc = Nokogiri::HTML(html_splc)
  headline_splc = doc_splc.css("h1").first.text
  error_headline = "Sorry, still waiting on headline from SPLC.org..."
  if headline_splc.scan(/\w/)
    headline_splc
  else
    error_headline
  end
end

def the_aclu_url_scraper
  html_aclu = open("https://www.aclu.org")
  doc_aclu = Nokogiri::HTML(html_aclu)
  step_1 = doc_aclu.css("div#hp__top_spotlight")
  step_2 = step_1.css("a")[0].to_a
  aclu_url = step_2[0][1]
  step_a_1 = doc_aclu.css("div#hp__top_carousel")
  step_a_2 = step_a_1.css("div.columns")
  step_a_3 = step_a_2.children
  step_a_4 = step_a_3[11]
  step_a_5 = step_a_4.css("a").first
  backup_url = step_a_5.attributes["href"].value
  error_url = "Sorry, waiting on article URL from ACLU.org..."
  if !aclu_url.scan(/\w/) && !!backup_url.scan(/\w/)
    backup_url
    elsif !!aclu_url.scan(/\w/)
    aclu_url
  else 
    error_url
  end
end

def the_amnesty_url_scraper 
  html_amnesty = open("https://www.amnesty.org/en")
  doc_amnesty = Nokogiri::HTML(html_amnesty)
  step_1 = doc_amnesty.xpath('//div/a/@href')
  step_2 = step_1[9].text
  amnesty_url = "https://www.amnesty.org/#{step_2}"
  error_url = "Sorry, still waiting on article URL from Amnesty International USA..."
  if !!amnesty_url.scan(/\w/)
    amnesty_url
  else
    error_url
  end
end 

def the_hrw_url_scraper
  html_hrw = open("https://www.hrw.org")
  doc_hrw = Nokogiri::HTML(html_hrw)
  hrw_url = "https://www.hrw.org#{doc_hrw.css("h3.billboard-title a").map { |link| link["href"] }[0]}"
  error_url = "Sorry, still waiting on article URL from Human Rights Watch..."
  if !!hrw_url.scan(/\w/)
    hrw_url
  else
    error_url
  end
end

def the_splc_url_scraper
  html_splc = open("https://www.splcenter.org")
  doc_splc = Nokogiri::HTML(html_splc)
  step_1 = doc_splc.css("section#highlighted")
  step_2 = step_1.css("div.field-items")
  step_3 = step_2[0].children
  step_4 = step_3[1].children.text
  splc_url = step_4.match(/https.*\w/)[0]
  error_url = "Sorry, still waiting on article URL from SPLCenter.org..."
  if !!splc_url.scan(/\w/)
    splc_url
  else 
    error_url
  end
end

def the_aclu_abstract_scraper
  html_aclu = open("#{the_aclu_url_scraper}")
  doc_aclu = Nokogiri::HTML(html_aclu)
  aclu_abstract = "#{doc_aclu.css("p")[1].text}     #{doc_aclu.css("p")[2].text}"
  backup_abstract = doc_aclu.css("div#tabs").text
  error_abstract = "Sorry, still waiting on article abstract from ACLU.org..."
  if !aclu_abstract.scan(/\w/) && !!aclu_abstract.scan(/\w/)
    backup_abstract
    elsif !!aclu_abstract.scan(/\w/)
    aclu_abstract
  else
    error_abstract
  end
end

def the_amnesty_abstract_scraper
  html_amnesty = open("#{the_amnesty_url_scraper}")
  doc_amnesty = Nokogiri::HTML(html_amnesty)
  amnesty_abstract = doc_amnesty.css("p")[6].text
  backup_abstract = doc_amnesty.css("p").text
  error_abstract = "Sorry, still waiting on article abstract from Amnesty International USA..."
  if !amnesty_abstract.scan(/\w/) && !!backup_abstract.scan(/\w/)
    backup_abstract
    elsif !!amnesty_abstract.scan(/\w/)
    amnesty_abstract
  else
    error_abstract
  end
end

def the_hrw_abstract_scraper
  html_hrw = open("#{the_hrw_url_scraper}")
  doc_hrw = Nokogiri::HTML(html_hrw)
  step_1 = doc_hrw.css("p")
  hrw_abstract = "#{step_1[4].text}   #{step_1[5].text}   #{step_1[6].text}"
  error_abstract = "Sorry, still waiting on article abstract from Human Rights Watch..."
  if !!hrw_abstract.scan(/\w/)
    hrw_abstract
  else 
    error_abstract
  end
end

def the_splc_abstract_scraper
  html_splc = open("#{the_splc_url_scraper}")
  doc_splc = Nokogiri::HTML(html_splc)
  splc_abstract = doc_splc.css("p").first.text
  error_abstract = "Sorry, still waiting on article abstract from SPLC.org"
  if !!splc_abstract.scan(/\w/)
    splc_abstract
  else
    error_abstract
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

def scrape_executor
  puts "Welcome to WokeApp!  Please wait a few moments for today's news..."
  aclu_object_maker
  amnesty_object_maker
  hrw_object_maker
  splc_object_maker
  welcome_menu
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
    story_selector_segue
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
    story_selector_segue
  end
end
