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