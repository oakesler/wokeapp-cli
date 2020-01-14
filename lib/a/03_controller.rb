require "./config/environment"

class Controller
  
  attr_accessor :news_hash, :current_news
  
  def initialize
    @display = Display.new
  end
  
  def woke_app
    Scraper.new
    @display.welcome_menu
    puts "         "
	  input = gets.strip
	  if input == "exit"
	    @display.exit
		  elsif input == "story"
		  @display.headline_display
		  input_1 = gets.strip
		  if ["aclu", "amnesty", "hrw", "splc"].include? input_1
		    @display.story_display(input_1.upcase)
		    @display.welcome_menu
		  elsif input == "random"
	  	@display.randomizer
	  	@display.welcome_menu
	  else
		  @display.welcome_menu
		end
  end
end