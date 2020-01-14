require "./config/environment"
require_relative "./01_model.rb"

class Display
  
  attr_accessor :scrape

  def initialize
    @scrape = Scraper.new
    #@@news_hash = @scrape.news_hash
  end
  
  def headline_display
    binding.pry
    puts "                         "
    puts "Please select a headline by entering its source (ACLU, Amnesty, HRW, SPLC)"
    puts "                          "
    @scrape.news_hash.keys.each do |source|
      puts "#{source["source"]} -- #{source["headline"]}"
    end
    puts "                                        "
    puts "...or type 'back' to return to menu"
    puts "  "
  end
  
  def story_display(source_name)
    puts "                      "
    puts "#{@@news_hash[":#{source_name}"]["source"]} -- (#{@news_hash[":#{source_name}"]["source_url"]})"
    puts "                          "
    puts "------------------------------------------"
    puts "#{@@news_hash[":#{source_name}"]["headline"]}"
    puts "------------------------------------------"
    puts "                            "
    puts "#{@@news_hash[":#{source_name}"]["abstract"]}"
    puts "                             "
    puts "Continue reading at"
    puts "#{@@news_hash[":#{source_name}"]["story_url"]}"
    puts "     "
  end
  
  def randomizer
    sample_array = ["ACLU", "Amnesty", "HRW", "SPLC"]
    x = sample_array.sample
    story_display(x)
  end

  
  def exit
    puts "Thanks for using WokeApp!"
		puts "       "
		puts "Questions? Comments? Email the WokeApp team at o.a.koenig@gmail.com"
	end
end