class StoryUrl 
  
  attr_accessor :source_url, :html_doc, :story_url, :error_url
  
  def initialize(url)
    @error_url = "Sorry, we're still generating this headline. Please check back later!"
    @source_url = url
    @html_doc = Nokogiri::HTML("#{open(@source_url)}")
    @story_url = self.url_maker
  end
  
  def url_maker