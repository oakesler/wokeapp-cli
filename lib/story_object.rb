require_relative "../config/environment"

class Story 
  attr_accessor :headline, :abstract, :source, :story_url, :home_url
  
  def initialize(source, home_url)
    @headline = headline
    @abstract = abstract
    @source = source
    @story_url = story_url
    @home_url = home_url
  end
end