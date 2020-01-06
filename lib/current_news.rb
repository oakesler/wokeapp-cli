class CurrentNews
  
  attr_accessor :source_one, :source_two, :source_three, :source_four
  
  def initialize(news_hash)
    @source_one = Story.new(news_hash[:source_one])
    @source_two = Story.new(news_hash[:source_two])
    @source_three = Story.new(news_hash[:source_three])
    @source_four = Story.new(news_hash[:source_four])
  end
end
  
  
  
  
  
  
  #Compiled_News_Object.new("www.ACLU.org", "https://www.amnesty.org/en/", "https://www.hrw.org/#", "https://www.splcenter.org")


#def aclu_object_maker
  #aclu_story = Story.new("ACLU", "www.aclu.org")
  #aclu_story.headline = the_aclu_headline_scraper
  #aclu_story.story_url = the_aclu_url_scraper
  #aclu_story.abstract = the_aclu_abstract_scraper
  #@story_hash[:ACLU] = aclu_story
#end

#def amnesty_object_maker 
  #amnesty_story = Story.new("Amnesty International USA", "www.amnestyusa.org")
  #amnesty_story.headline = the_amnesty_headline_scraper
  #amnesty_story.story_url = the_amnesty_url_scraper
  #amnesty_story.abstract = the_amnesty_abstract_scraper
  #@story_hash[:Amnesty] = amnesty_story
#end

#def hrw_object_maker
  #hrw_story = Story.new("Human Rights Watch", "www.hrw.org")
  #hrw_story.headline = the_hrw_headline_scraper
  #hrw_story.story_url = the_hrw_url_scraper
  #hrw_story.abstract = the_hrw_abstract_scraper
  #@story_hash[:HRW] = hrw_story
#end

#def splc_object_maker
  #splc_story = Story.new("Southern Poverty Law Center", "www.splcenter.org")
  #splc_story.headline = the_splc_headline_scraper
  #splc_story.story_url = the_splc_url_scraper
  #splc_story.abstract = the_splc_abstract_scraper
  #@story_hash[:SPLC] = splc_story
#end

#########################################################

#def scrape_executor
  #puts "Welcome to WokeApp!  Please wait a few moments for today's news..."
  #aclu_object_maker
  #amnesty_object_maker
  #hrw_object_maker
  #splc_object_maker
  #welcome_menu
#end

##########################################

#news hash = {:source_one => "American Civil Liberties Union", :source_two => "Amnesty International US", :source_three => "Human Rights Watch", :source_four =>"Southern Poverty Law Center"}