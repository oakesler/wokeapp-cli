class Headline 
  
  attr_accessor :source_url
  
  def initialize(url)
    @source_url = url
    @headline = self.headline_maker
  end
  
  def headline_maker
    if source_url ==  "www.ACLU.org"
      html_aclu = open(self.home_url)
      doc_aclu = Nokogiri::HTML(html_aclu)
      step_1 = doc_aclu.css("div#hp__top_spotlight")
      headline_aclu = step_1.css("div")[4].children[0].text.strip
      backup_headline = doc_aclu.css('span.is-uppercase').text
      error_headline = "Sorry, still waiting on headline from ACLU.org..."
      if !headline_aclu.scan(/\w/) && !!backup_headline.scan(/\w/)
        backup_headline
        elsif !!headline_aclu.scan(/\w/)
        headline_aclu
      else
        error_headline
      end
    elsif source_url == "https://www.amnesty.org/en/"
      html_amnesty = open("https://www.amnesty.org/en/")
      doc_amnesty = Nokogiri::HTML(html_amnesty)
      headline_amnesty = "#{doc_amnesty.css('span.heading--tape').text}: #{doc_amnesty.css('p.image-headline__copy').text}"
      error_headline = "Sorry, still waiting on headline from Amnesty International USA"
      if headline_amnesty.scan(/\w/)
        headline_amnesty
      else
        error_headline
      end
    elsif source_url == "https://www.hrw.org/#"
      html_hrw = open("https://www.hrw.org/#")
      doc_hrw = Nokogiri::HTML(html_hrw)
      headline_hrw = doc_hrw.css('h3.billboard-title').text
      error_headline = "Sorry, still waiting on headline from Human Rights Watch..."
      if !!headline_hrw.scan(/\w/)
        headline_hrw
      else
        error_headline
      end
    elsif source_url == "https://www.splcenter.org"
      html_splc = open("https://www.splcenter.org")
      doc_splc = Nokogiri::HTML(html_splc)
      headline_splc = doc_splc.css("h1").first.text
      error_headline = "Sorry, still waiting on headline from SPLC.org..."
      if headline_splc.scan(/\w/)
        headline_splc
      else
        error_headline
      end
  else
    "Error"
  end
end
    