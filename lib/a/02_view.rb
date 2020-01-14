require "./config/environment"

class Display
  
  def initialize
    Scraper.new
  end
  
  def welcome_menu
    puts "                                      "
    puts "Select by story or use our randomizer."
	  puts "For story selection, type ‘story'"
	  puts "For randomizer, type ‘random'"
	  puts "To exit, type ‘exit’"
	  puts "                       "
	end
  
  def headline_display
    puts "                         "
    puts "Please select a headline by entering its source (ACLU, Amnesty, HRW, SPLC)"
    puts "                          "
    @@news_hash.each do |source|
      puts "#{x}. #{source["source"]} -- #{source["headline"]}"
    end
    puts "                                        "
    puts "...or type 'back' to return to menu"
    puts "  "
  end
  
  def story_display(source_name)
    puts "                      "
    puts "#{@@news_hash[":#{source_name}"]["source"]} -- (#{@@news_hash[":#{source_name}"]["source_url"]})"
    puts "                          "
    puts "------------------------------------------"
    puts "#{@@news_hash[":#{source_name}"]["headline"]}"
    puts "------------------------------------------"
    puts "                            "
    puts "#{@@news_hash[":#{source_name}"]["abstract"]}"
    puts "                             "
    puts "Continue reading at"
    puts "#{@@news_hash[":#{source_name}"]["story_url"]}"
    puts "     "
  end
  
  def randomizer
    sample_array = ["ACLU", "Amnesty", "HRW", "SPLC"]
    x = sample_array.sample
    story_display(x)
  end

  
  def exit
    puts "Thanks for using WokeApp!"
		puts "       "
		puts "Questions? Comments? Email the WokeApp team at o.a.koenig@gmail.com"
	end
end