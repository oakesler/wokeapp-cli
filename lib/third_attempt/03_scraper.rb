class Scraper
  
  @@all = []
  
  def initialize 
    @@all << self
  end
  
  def aclu_scraper
    @aclu_story = Story.new
    html_doc = Nokogiri::HTML(open(@news_hash[:ACLU]["source_url"]))
    step_1 = html_doc.css("div#hp__top_spotlight")
    headline_aclu = step_1.css("div")[4].children[0].text.strip
    if !!headline_aclu.scan(/\w/)
      @aclu_story.headline = headline_aclu
    else
      @aclu_story.headline = "Sorry, still gathering news from ACLU.org..."
    end
    step_1 = html_doc.css("div#hp__top_spotlight")
    step_2 = step_1.css("a")[0].to_a
    @aclu_story.story_url = step_2[0][1]
    if !! @aclu_story.story_url.scan(/aclu/)
      article_html_doc = Nokogiri::HTML(open(@aclu_story.story_url))
      @aclu_story.abstract = "#{article_html_doc.css("p")[1].text}     #{article_html_doc.css("p")[2].text}"
    else 
      @aclu_story.abstract = "Sorry, still gathering news from ACLU.org..."
      @aclu_story.story_url = "Sorry, still gathering news from ACLU.org..."
    end
  end 
  #------------------------------------------------------------------------------------# 
  def amnesty_scraper 
    html_doc = Nokogiri::HTML(open(@news_hash[:Amnesty]["source_url"]))
    @news_hash[:Amnesty]["headline"] = "#{html_doc.css('span.heading--tape').text}: #{html_doc.css('p.image-headline__copy').text}".slice(0, 44)
    if !@news_hash[:Amnesty]["headline"].scan(/\w/)
      @news_hash[:Amnesty]["headline"] = "Sorry, still gathering news from Amnesty International..."
    end
    step_1 = html_doc.xpath('//div/a/@href').text
    @news_hash[:Amnesty]["story_url"] = "https://www.amnesty.org/#{step_1}"
    if !!@news_hash[:Amnesty]["story_url"].scan(/amnesty/)
      article_html_doc = Nokogiri::HTML(open(@news_hash[:Amnesty]["source_url"]))
      @news_hash[:Amnesty]["abstract"] = "#{article_html_doc.css("p").text.slice(0, 175)}..."
    else 
      @news_hash[:Amnesty]["abstract"] = "Sorry, still gathering news from Amnesty International"
      @news_hash[:Amnesty]["story_url"] = "Sorry, still gathering news from Amnesty International"
    end
  end
  #------------------------------------------------------------------------------------# 
  def hrw_scraper
    html_doc = Nokogiri::HTML(open(@news_hash[:HRW]["source_url"]))
    @news_hash[:HRW]["headline"] = html_doc.css('h3.billboard-title').text
    if !!@news_hash[:HRW]["headline"].scan(/\w/)
      link = html_doc.css("h3.billboard-title a").map { |link| link["href"] }[0]
      @news_hash[:HRW]["story_url"] = "https://www.hrw.org#{link}"
    end
    if !!@news_hash[:HRW]["story_url"].scan(/hrw/)
      article_html_doc = Nokogiri::HTML(open(@news_hash[:Amnesty]["source_url"]))
      step_1 = article_html_doc.css("p")
      @news_hash[:HRW]["abstract"] = "#{step_1.text.slice(0, 270)}..."
    else
      @news_hash[:HRW]["headline"] = "Sorry, still gathering news from ACLU.org..."
      @news_hash[:HRW]["abstract"] = "Sorry, still gathering news from ACLU.org..."
      @news_hash[:HRW]["story_url"] = "Sorry, still gathering news from ACLU.org..."
    end
  end
  #------------------------------------------------------------------------------------#
  def splc_scraper
    html_doc = Nokogiri::HTML(open(@news_hash[:SPLC]["source_url"]))
    @news_hash[:SPLC]["headline"] = html_doc.css("h1").first.text
    if !@news_hash[:SPLC]["headline"].scan(/\w/)
      @news_hash[:SPLC]["headline"] = "Sorry, still gathering news from SPLCenter.org..."
    end
    step_a_1 = html_doc.css("section#highlighted") 
    step_a_2 = step_a_1.css("div.field-items")
    @news_hash[:SPLC]["story_url"] = step_a_2.xpath('//div/a/@href')[1].value
    if !!@news_hash[:SPLC]["story_url"].scan(/splc/)
      article_html_doc = Nokogiri::HTML(open(@news_hash[:SPLC]["story_url"]))
      @news_hash[:SPLC]["abstract"] = article_html_doc.css("p").first.text
    else 
      @news_hash[:SPLC]["abstract"] = "Sorry, still gathering news from ACLU.org..."
      @news_hash[:SPLC]["story_url"] = "Sorry, still gathering news from ACLU.org..."
    end
  end
end
end