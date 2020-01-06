require "./config/environment"


class Abstract 
  
  attr_accessor :source_url, :html_doc, :abstract, :error_abstract
  
  def initialize(url)
    @error_abstract = "Sorry, we're still generating this abstract. Please check back later!"
    @source_url = url
    @html_doc = Nokogiri::HTML(open(@source_url))
    @abstract = self.abstract_maker
  end
  
  def abstract_maker
    if @source_url == "https://www.aclu.org/"
      aclu_abstract = "#{@html_doc.css("p")[1].text}     #{@html_doc.css("p")[2].text}"
      backup_abstract = @html_doc.css("div#tabs").text
      if !!aclu_abstract.scan(/\w/)
        aclu_abstract
        elsif !!backup_abstract.scan(/\w/)
        backup_abstract
      else 
        @error_abstract
      end
      ####################################################################
      elsif source_url == "https://www.amnesty.org/en/"
      amnesty_abstract = @html_doc.css("p")[6].text
      backup_abstract = @html_doc.css("p").text
      if !!amnesty_abstract.scan(/\w/)
        amnesty_abstract
        elsif !!backup_abstract.scan(/\w/)
        backup_abstract
      else 
        @error_abstract
      end
      ####################################################################
      elsif source_url == "https://www.hrw.org/#"
      step_1 = @html_doc.css("p")
      hrw_abstract = "#{step_1[4].text}   #{step_1[5].text}   #{step_1[6].text}"
      if !!hrw_abstract.scan(/\w/)
        hrw_abstract
      else 
        @error_abstract
      end
      #######################################################################
      elsif source_url == "https://www.splcenter.org"
      html_splc = open("#{the_splc_url_scraper}")
      doc_splc = Nokogiri::HTML(html_splc)
      splc_abstract = @html_doc.css("p").first.text
      if !!splc_abstract.scan(/\w/)
        splc_abstract
      else
        @error_abstract
      end
    else
      @error_abstract
    end
  end
end