require "./config/environment"

class Scraper
  
  @@all = { }
  
  def initialize(url)
    #@error = "Sorry, still generating this...please check back later!"
    #@source_url = url
    #@html_doc = Nokogiri::HTML(open(@source_url))
    #@headline = self.headline_maker
  end
  
  def aclu_scraper
    def headline_maker
    if @source_url == "https://www.aclu.org/"
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
    
    if @source_url == "https://www.aclu.org/"
      step_1 = @html_doc.css("div#hp__top_spotlight")
      step_2 = step_1.css("a")[0].to_a
      aclu_url = step_2[0][1]
      
      def abstract_maker
    if !!@source_url.scan(/aclu/)
      aclu_abstract = "#{@html_doc.css("p")[1].text}     #{@html_doc.css("p")[2].text}"
      backup_abstract = @html_doc.css("div#tabs").text
      if !!aclu_abstract.scan(/\w/)
        aclu_abstract
        elsif !!backup_abstract.scan(/\w/)
        backup_abstract
      else 
        @error_abstrac
    
  end 
end
  