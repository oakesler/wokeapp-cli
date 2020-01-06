require_relative "../config/environment"

class CurrentNews
  
  attr_accessor :source_one, :source_two, :source_three, :source_four
  
  def initialize(news_hash)
    @source_one = Story.new(news_hash[:source_one])
    @source_two = Story.new(news_hash[:source_two])
    @source_three = Story.new(news_hash[:source_three])
    @source_four = Story.new(news_hash[:source_four])
  end
  
  def headline_display
    @s
end


  def story_display
  puts "                      "
  puts "#{@story_hash[:ACLU].source} (#{@story_hash[:ACLU].home_url})"
  puts "                          "
  puts "------------------------------------------"
  puts "#{@story_hash[:ACLU].headline}"
  puts "------------------------------------------"
  puts "                            "
  puts "#{@story_hash[:ACLU].abstract}"
  puts "                             "
  puts "Continue reading at"
  puts "#{@story_hash[:ACLU].story_url}"
  puts "                                 "
  welcome_menu
end
end
