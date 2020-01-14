require "./config/environment"

#class Controller
  
  attr_accessor :news_hash, :current_news
  
  def initialize(news_hash)
    @view = CurrentNews.new(news_hash)
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
    puts "1. #{@current_news.source_one.headline.headline}"
    puts "2. #{@current_news.source_two.headline.headline}"
    puts "3. #{@current_news.source_three.headline.headline}"
    puts "4. #{@current_news.source_four.headline.headline}"
    puts "                                        "
    puts "...or type 'back' to return to menu"
    puts "                           "
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

def randomizer
  sample_array = [1, 2, 3, 4]
  x = sample_array.sample
  if x == 1
    @current_news.source_one.story_display
    sample_array.delete(1)
    welcome_menu
    elsif x == 2
    @current_news.source_two.story_display
    sample_array.delete(2)
    welcome_menu
    elsif x == 3
    @current_news.source_three.story_display
    sample_array.delete(3)
    welcome_menu
    elsif x == 4
    @current_news.source_four.story_display
    sample_array.delete(4)
    welcome_menu
  else 
    welcome_menu
  end
end
end
