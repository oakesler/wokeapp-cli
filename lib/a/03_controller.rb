require "./config/environment"

class Controller
  
  attr_accessor :display
  
  def initialize
    @display = Display.new
  end
  
  @display.welcome
  
end
  