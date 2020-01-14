require "./config/environment"

class Controller
  
  attr_accessor :display
  
  def initialize
    @display = Display.new
  end
  
  def welcome
    puts "Welcome to WokeApp!  Please wait a few moments for your summary on today's social justice news..."
    @display.menu
  end
end
  