class Abstract 
  
  attr_accessor :source_url, :html_doc, :abstract, :error_abstract
  
  def initialize(url)
    @error_abstract = "Sorry, we're still generating this abstract. Please check back later!"
    @source_url = url
    @html_doc = Nokogiri::HTML("#{open(@source_url)}")
    @abstract = self.abstract_maker
  end
  
  def abstract_maker
    if @source_url == "www.ACLU.org"
      
      
      
      
      else
        @error_abstract
      end
      
    elsif source_url == "https://www.amnesty.org/en/"
    
     
     
     
     
      else
        @error_abstract
      end
    elsif source_url == "https://www.hrw.org/#"
    
    

        
        
      else
        @error_abstract
      end
    elsif source_url == "https://www.splcenter.org"
    
      
        
        
      else
        @error_abstract 
      end
    else
    "Error"
  end
end




def the_aclu_abstract_scraper
  html_aclu = open("#{the_aclu_url_scraper}")
  doc_aclu = Nokogiri::HTML(html_aclu)
  aclu_abstract = "#{doc_aclu.css("p")[1].text}     #{doc_aclu.css("p")[2].text}"
  backup_abstract = doc_aclu.css("div#tabs").text
  error_abstract = "Sorry, still waiting on article abstract from ACLU.org..."
  if !aclu_abstract.scan(/\w/) && !!aclu_abstract.scan(/\w/)
    backup_abstract
    elsif !!aclu_abstract.scan(/\w/)
    aclu_abstract
  else
    error_abstract
  end
end

def the_amnesty_abstract_scraper
  html_amnesty = open("#{the_amnesty_url_scraper}")
  doc_amnesty = Nokogiri::HTML(html_amnesty)
  amnesty_abstract = doc_amnesty.css("p")[6].text
  backup_abstract = doc_amnesty.css("p").text
  error_abstract = "Sorry, still waiting on article abstract from Amnesty International USA..."
  if !amnesty_abstract.scan(/\w/) && !!backup_abstract.scan(/\w/)
    backup_abstract
    elsif !!amnesty_abstract.scan(/\w/)
    amnesty_abstract
  else
    error_abstract
  end
end

def the_hrw_abstract_scraper
  html_hrw = open("#{the_hrw_url_scraper}")
  doc_hrw = Nokogiri::HTML(html_hrw)
  step_1 = doc_hrw.css("p")
  hrw_abstract = "#{step_1[4].text}   #{step_1[5].text}   #{step_1[6].text}"
  error_abstract = "Sorry, still waiting on article abstract from Human Rights Watch..."
  if !!hrw_abstract.scan(/\w/)
    hrw_abstract
  else 
    error_abstract
  end
end

def the_splc_abstract_scraper
  html_splc = open("#{the_splc_url_scraper}")
  doc_splc = Nokogiri::HTML(html_splc)
  splc_abstract = doc_splc.css("p").first.text
  error_abstract = "Sorry, still waiting on article abstract from SPLC.org"
  if !!splc_abstract.scan(/\w/)
    splc_abstract
  else
    error_abstract
  end
end