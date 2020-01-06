require_relative "../config/environment"

class ACLU_Scraper 
  attr_accessor :headline, :abstract, :source, :story_url, :home_url
  

  def headline
    html_aclu = open("www.ACLU.org")
    doc_aclu = Nokogiri::HTML(html_aclu)
    step_1 = doc_aclu.css("div#hp__top_spotlight")
    headline_aclu = step_1.css("div")[4].children[0].text.strip
    backup_headline = doc_aclu.css('span.is-uppercase').text
    error_headline = "Sorry, still waiting on headline from ACLU.org..."
    if !headline_aclu.scan(/\w/) && !!backup_headline.scan(/\w/)
      backup_headline
      elsif !!headline_aclu.scan(/\w/)
      self.headline = headline_aclu
    else
      self.headline = error_headline
    end
  end
  
  def url_maker
    html_aclu = open("www.ACLU.org")
    doc_aclu = Nokogiri::HTML(html_aclu)
    step_1 = doc_aclu.css("div#hp__top_spotlight")
    step_2 = step_1.css("a")[0].to_a
    aclu_url = step_2[0][1]
    step_a_1 = doc_aclu.css("div#hp__top_carousel")
    step_a_2 = step_a_1.css("div.columns")
    step_a_3 = step_a_2.children
    step_a_4 = step_a_3[11]
    step_a_5 = step_a_4.css("a").first
    backup_url = step_a_5.attributes["href"].value
    error_url = "Sorry, waiting on article URL from ACLU.org..."
    if !aclu_url.scan(/\w/) && !!backup_url.scan(/\w/)
      self.story_url = backup_url
      elsif !!aclu_url.scan(/\w/)
      self.story_url = aclu_url
    else
      self.story_url = error_url
    end
  end
  
  def abstract
    html_aclu = open(self.story_url)
    doc_aclu = Nokogiri::HTML(html_aclu)
    aclu_abstract = "#{doc_aclu.css("p")[1].text}     #{doc_aclu.css("p")[2].text}"
    backup_abstract = doc_aclu.css("div#tabs").text
    error_abstract = "Sorry, still waiting on article abstract from ACLU.org..."
    if !aclu_abstract.scan(/\w/) && !!aclu_abstract.scan(/\w/)
      backup_abstract
      elsif !!aclu_abstract.scan(/\w/)
      self.abstract = aclu_abstract
    else
      self.abstract = error_abstract
    end
  end
end