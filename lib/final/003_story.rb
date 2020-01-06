require "./config/environment"

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
  
  def story_display
    puts "                      "
    puts "#{@source} (#{@home_url})"
    puts "                          "
    puts "------------------------------------------"
    puts "#{@headline}"
    puts "------------------------------------------"
    puts "                            "
    puts "#{@abstract}"
    puts "                             "
    puts "Continue reading at"
    puts "#{@story_url}"
    puts "                                 "
  end
end