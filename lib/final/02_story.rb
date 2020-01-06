require_relative "../config/environment"

class Story 
  attr_accessor :headline, :abstract, :source, :story_url, :home_url

  def initialize(source_hash)
    @source = source_hash[name]
    @home_url = source_hash[url]
    story = @source.new(@home_url)
    @headline = Headline.new(@home_url)
    @story_url = StoryUrl.new(@home_url)
    @abstract = Abstract.new(@story_url)
  end
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