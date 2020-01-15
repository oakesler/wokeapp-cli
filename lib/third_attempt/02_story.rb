require "./config/environment"

class Story
  
  attr_accessor :source, :source_url, :headline, :abstract, :story_url
  
  @@all = []
  
  def initialize 
    @@all << self
  end
  
  def self.all 
    @@all 
  end
end