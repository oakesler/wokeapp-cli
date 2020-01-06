class Headline 
  
  attr_accessor :source_url, :html_doc, :headline
  
  def initialize(url)
    @error_headline = "Sorry, we're still generating this headline. Please check back later!"
    @source_url = url
    @html_doc = Nokogiri::HTML("#{open(@source_url)}")
    @headline = self.headline_maker
  end
  
  def headline_maker
    if self.source_url == "www.ACLU.org"
      step_1 = @html_doc.css("div#hp__top_spotlight")
      headline_aclu = step_1.css("div")[4].children[0].text.strip
      backup_headline = @html_doc.css('span.is-uppercase').text
      if !!headline_aclu.scan(/\w/) 
        headline_aclu
        elsif !!backup_headline.scan(/\w/)
        backup_headline
      else
        @error_headline
      end
    elsif source_url == "https://www.amnesty.org/en/"
      headline_amnesty = "#{@html_doc.css('span.heading--tape').text}: #{@html_doc.css('p.image-headline__copy').text}"
      if headline_amnesty.scan(/\w/)
        headline_amnesty
      else
        @error_headline
      end
    elsif source_url == "https://www.hrw.org/#"
      headline_hrw = @html_doc.css('h3.billboard-title').text
      if !!headline_hrw.scan(/\w/)
        headline_hrw
      else
        @error_headline
      end
    elsif source_url == "https://www.splcenter.org"
      headline_splc = @html_doc.css("h1").first.text
      if headline_splc.scan(/\w/)
        headline_splc
      else
        @error_headline
      end
    else
    "Error"
  end
end
end
    