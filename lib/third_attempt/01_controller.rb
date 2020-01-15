require "./config/environment"

class Controller
  
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
    Story.all.each do |item|
      puts "#{x} #{item.source} -- #{item.headline}"
      x += 1
    end
    puts "...or type 'back' to return to menu"
		puts "               "
		input = gets.strip
		if ["1", "2", "3", "4"].include?(input)
		  story_display(input.to_i)
		else
		  menu 
	  end
  end
		  
  def story_display(index)
    @story = Story.all[index]
    puts "                      "
    puts "#{@story.source} -- (#{@story.source_url})"
    puts "                          "
    puts "------------------------------------------"
    puts "#{@story.headline}"
    puts "------------------------------------------"
    puts "                            "
    puts "#{@story.abstract}"
    puts "                             "
    puts "Continue reading at"
    puts "#{@story.story_url}"
    puts "     "
    menu
  end
  
  def randomizer
    sample_array = [1, 2, 3, 4]
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