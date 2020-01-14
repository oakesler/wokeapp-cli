require "./config/environment"

class Controller
  
  def initialize
    @display = Display.new
  end
  
  def welcome
    puts "                                      "
    puts "Select by story or use our randomizer."
	  puts "For story selection, type ‘story'"
	  puts "For randomizer, type ‘random'"
	  puts "To exit, type ‘exit’"
	  puts "                       "
	  input = gets.strip
	  if input == "exit"
	    @display.exit
		  elsif input == "story"
		  @display.headline_display
		  input_1 = gets.strip
		  if ["aclu", "amnesty", "hrw", "splc"].include? input_1
		    @display.story_display(input_1.upcase)
		    welcome
		  end
		  elsif input == "random"
	  	@display.randomizer
	  	welcome_menu
	  else
		  welcome_menu
		end
  end
end