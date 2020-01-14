require "./config/environment"

class Scraper
  
  @@news_hash = {:ACLU => {'source' => 'American Civil Liberties Union', 
  'source_url' => 'https://www.aclu.org/', 'headline' => ' ', 'story_url' => ' ', 'abstract' => ' '}, :Amnesty => {'source' => 'Amnesty International', 'source_url' => "https://www.amnesty.org/en/", 'headline' => ' ', 'story_url' => ' ', 'abstract' => ' '}, :HRW => {'source' => 'Human Rights Watch', 'source_url' => "https://www.hrw.org/#", 'headline' => ' ', 'story_url' => ' ', 'abstract' => ' '}, :SPLC => {'source' => 'Southern Poverty Law Center', 'source_url' => "https://www.splcenter.org", 'headline' => ' ', 'story_url' => ' ', 'abstract' => ' '}}
 #------------------------------------------------------------------------------------# 
  
  def initialize
    aclu_scraper
    amnesty_scraper
    hrw_scraper
    splc_scraper
  end

  def aclu_scraper
    html_doc = Nokogiri::HTML(open(@@news_hash["ACLU"]["source_url"]))
    step_1 = html_doc.css("div#hp__top_spotlight")
    headline_aclu = step_1.css("div")[4].children[0].text.strip
    if !!headline_aclu.scan(/\w/)
      @@news_hash["ACLU"]["headline"] = headline_aclu
    else
      @@news_hash["ACLU"]["headline"] = "Sorry, still gathering news from ACLU.org..."
    end
    step_1 = html_doc.css("div#hp__top_spotlight")
    step_2 = step_1.css("a")[0].to_a
    @@news_hash["ACLU"]["story_url"] = step_2[0][1]
    if !! @@news_hash["ACLU"]["story_url"].scan(/aclu/)
      article_html_doc = Nokogiri::HTML(open(@@news_hash["ACLU"]["article_url"]))
      @@news_hash["ACLU"]["abstract"] = "#{article_html_doc.css("p")[1].text}     #{article_html_doc.css("p")[2].text}"
    else 
      @@news_hash["ACLU"]["abstract"] = "Sorry, still gathering news from ACLU.org..."
      @@news_hash["ACLU"]["story_url"] = "Sorry, still gathering news from ACLU.org..."
    end
  end 
  #------------------------------------------------------------------------------------# 
  def amnesty_scraper 
    html_doc = Nokogiri::HTML(open(@@news_hash["Amnesty"]["source_url"]))
    @@news_hash["Amnesty"]["headline"] = "#{html_doc.css('span.heading--tape').text}: #{html_doc.css('p.image-headline__copy').text}"
    if !@@news_hash["Amnesty"]["headline"].scan(/\w/)
      @@news_hash["Amnesty"]["headline"] = "Sorry, still gathering news from Amnesty International..."
    end
    step_1 = html_doc.xpath('//div/a/@href')
    step_2 = step_1[9].text
    @@news_hash["Amnesty"]["story_url"] = "https://www.amnesty.org/#{step_2}"
    if !!@@news_hash["Amnesty"]["story_url"].scan(/amnesty/)
      @@news_hash["Amnesty"]["abstract"] = @@news_hash["Amnesty"]["story_url"].css("p")[6].text
    else 
      @@news_hash["Amnesty"]["abstract"] = "Sorry, still gathering news from Amnesty International"
      @@news_hash["Amnesty"]["story_url"] = "Sorry, still gathering news from Amnesty International"
    end
  end
  #------------------------------------------------------------------------------------# 
  def hrw_scraper 
    html_doc = Nokogiri::HTML(open(@@news_hash["HRW"]["source_url"]))
    headline_hrw = html_doc.css('h3.billboard-title').text
    if !!headline_hrw.scan(/\w/)
      @@news_hash["Amnesty"]["abstract"] = headline_hrw
    else
      @@news_hash["Amnesty"]["abstract"] = "Sorry, still gathering news from Human Rights Watch..."
    end
    @@news_hash["Amnesty"]["story_url"] == "https://www.hrw.org#{html_doc.css("h3.billboard-title a").map { |link| link["href"] }[0]}"
    if !!@@news_hash["Amnesty"]["story_url"].scan(/hrw/)
      step_1 = @@news_hash["Amnesty"]["story_url"].css("p")
      @@news_hash["Amnesty"]["abstract"] = "#{step_1[4].text}   #{step_1[5].text}   #{step_1[6].text}"
    else
      @@news_hash["HRW"]["abstract"] = "Sorry, still gathering news from ACLU.org..."
      @@news_hash["HRW"]["story_url"] = "Sorry, still gathering news from ACLU.org..."
    end
  end
  #------------------------------------------------------------------------------------#
  def splc_scraper
    html_doc = Nokogiri::HTML(open(@@news_hash["SPLC"]["source_url"]))
    @@news_hash["SPLC"]["headline"] = @@html_doc.css("h1").first.text
    if !@@news_hash["SPLC"]["headline"].scan(/\w/)
      @@news_hash["SPLC"]["headline"] = "Sorry, still gathering news from SPLCenter.org..."
    end
    step_a_1 = html_doc.css("section#highlighted") 
    step_a_2 = step_a_1.css("div.field-items")
    @@news_hash["SPLC"]["story_url"] = step_a_2.xpath('//div/a/@href')[1].value
    if !!@@news_hash["SPLC"]["story_url"].scan(/splc/)
      article_html_splc = open("#{@@news_hash["SPLC"]["story_url"]}")
      doc_splc = Nokogiri::HTML(article_html_splc)
      @@news_hash["SPLC"]["abstract"] = @@html_doc.css("p").first.text
    else 
      @@news_hash["SPLC"]["abstract"] = "Sorry, still gathering news from ACLU.org..."
      @@news_hash["SPLC"]["story_url"] = "Sorry, still gathering news from ACLU.org..."
    end
  end
end
