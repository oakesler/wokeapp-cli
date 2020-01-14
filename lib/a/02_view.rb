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
	  puts "    "
	end
  
  def headline_display
    puts "                         "
    puts "Please select a headline by entering its source"
    puts "   "
    @@news_hash.each do |source|
      puts "#{x}. #{source["source"} -- #{source["headline"]}"
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
    input = gets.strip
    if input == "1"
      @current_news.source_one.story_display
      headline_display
      elsif input == "2"
      @current_news.source_two.story_display
      headline_display
      elsif input == "3"
      @current_news.source_three.story_display
      headline_display
      elsif input == "4"
      @current_news.source_four.story_display
      headline_display
      elsif input == "back"
      welcome_menu
    else 
      welcome_menu
    end
  end