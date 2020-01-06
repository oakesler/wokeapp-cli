require_relative "../config/environment"

class Story 
  attr_accessor :headline, :abstract, :source, :story_url, :home_url
  
  array = ["American Civil Liberties Union", "Amnesty International US", "Human Rights Watch", "Southern Poverty Law Center"]
  def initialize(home_url)
    @source = "ACLU"
    @home_url = home_url
    @headline = self.headline_maker(home_url)
    @story_url = self.url_maker(home_url)
    @abstract = self.abstract_maker(self.story_url)
  end







#require_relative "../config/environment"

#class Story 
  #attr_accessor :headline, :abstract, :source, :story_url, :home_url
  
  #def initialize(source, home_url)
    #@headline = headline
    #@abstract = abstract
    #@source = source
    #@story_url = story_url
    #@home_url = home_url
  #end
#end