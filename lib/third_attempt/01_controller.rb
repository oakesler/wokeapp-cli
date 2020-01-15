require "./config/environment"
require_relative "./01_model.rb"

class Controller
  
  array = []

  def initialize
    @scraper = Scraper.new
  end
  
  def menu
    puts "                                      "
    puts "Select by story or use our randomizer."
	  puts "For story selection, type ‘story'"
	  puts "For randomizer, type ‘random'"
	  puts "To exit, type ‘exit’"
	  puts "                       "
	  input = gets.strip
	  if input == "exit"
	    exit_strategy
	    elsif input == "story"
		  headline_display
		  elsif input == "random"
		  randomizer
		else 
		  menu
		end
	end
	
  def headline_display
    x = 1
    puts "                         "
    puts "Please select a headline by entering its number (1-4):"
    puts "                          "
    Story.all do |item|
      puts "#{x} #{item.source"} -- #{item.headline}"
      array << "#{x} #{item.source"} -- #{item.headline}"
      x += 1
    end
    puts "...or type 'back' to return to menu"
		puts "  "
		input = gets.strip
		array.each do |item|
		  if item.include? input
		    story_display(input)
		  end
		end
		
		  
		
		
		
		
		
		if ["aclu", "amnesty", "hrw", "splc", "ACLU", "Amnesty", "AMNESTY", "HRW", "SPLC"].include? input
		  if !!input.match(/amnesty/i)
		    story_display(input.capitalize)
		  else 
		    story_display(input.upcase)
		  end
		else
		  menu
		end
	end
		  
  def story_display(source_name)
    puts "                      "
    puts "#{@scrape.news_hash[source_name.to_sym]["source"]} -- (#{@scrape.news_hash[source_name.to_sym]["source_url"]})"
    puts "                          "
    puts "------------------------------------------"
    puts "#{@scrape.news_hash[source_name.to_sym]["headline"]}"
    puts "------------------------------------------"
    puts "                            "
    puts "#{@scrape.news_hash[source_name.to_sym]["abstract"]}"
    puts "                             "
    puts "Continue reading at"
    puts "#{@scrape.news_hash[source_name.to_sym]["story_url"]}"
    puts "     "
    menu
  end
  
  def randomizer
    sample_array = ["ACLU", "Amnesty", "HRW", "SPLC"]
    x = sample_array.sample
    story_display(x)
  end
  
  def exit_strategy
    puts "     "
    puts "Thanks for using WokeApp!"
		puts "       "
		puts "Questions? Comments? Email the WokeApp team at o.a.koenig@gmail.com"
	end
end
end