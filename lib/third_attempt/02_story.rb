class Story
  
  attr_accessor :source, :source_url, :headline, :abstract, :story_url
  
  @@all = []
  
  def initialize 
  end
  
  def self.all 
    @@all 
  end
  
end


  
end