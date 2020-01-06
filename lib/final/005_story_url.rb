require "./config/environment"

class StoryUrl 
  
  attr_accessor :source_url, :html_doc, :url, :error_url
  
  def initialize(url)
    @error_url = "Sorry, we're still generating this URL. Please check back later!"
    @source_url = url
    @html_doc = Nokogiri::HTML(open(@source_url))
    @url = self.url_maker
  end
  
  def valid_url?(url)
    uri = URI.parse(url)
    uri.is_a?(URI::HTTP) && !uri.host.nil?
    rescue URI::InvalidURIError
    true
  end
  
  def url_maker
    
    if @source_url == "https://www.aclu.org/"
      step_1 = @html_doc.css("div#hp__top_spotlight")
      step_2 = step_1.css("a")[0].to_a
      aclu_url = step_2[0][1]
      if !!aclu_url.scan(/\w/)
        aclu_url
        elsif !aclu_url.scan(/\w/)
        step_a_1 = doc_aclu.css("div#hp__top_carousel")
        step_a_2 = step_a_1.css("div.columns")
        step_a_3 = step_a_2.children
        step_a_4 = step_a_3[11]
        step_a_5 = step_a_4.css("a").first
        if !!step_a_5.scan(/\w/)
          backup_url = step_a_5.attributes["href"].value
        else
          @error_url
        end
      else
        @error_url
      end
    #########################################################
    elsif @source_url == "https://www.amnesty.org/en/"
    step_1 = @html_doc.xpath('//div/a/@href')
    step_2 = step_1[9].text
    amnesty_url = "https://www.amnesty.org/#{step_2}"
    if !!amnesty_url.scan(/\w/)
      amnesty_url
    else
      @error_url
    end
  #end
  ############################################################
  elsif @source_url == "https://www.hrw.org"
  hrw_url = "https://www.hrw.org#{@html_doc.css("h3.billboard-title a").map { |link| link["href"] }[0]}"
  if !!hrw_url.scan(/\w/)
    hrw_url
  else
    @error_url
  end
  #############################################################
  elsif @source_url == "https://www.splcenter.org" 
    step_a_1 = @html_doc.css("section#highlighted") 
    step_a_2 = step_a_1.css("div.field-items")
    splc_url = step_a_2.xpath('//div/a/@href')[1].value
    if !!valid_url?("#{splc_url}")
      splc_url
      elsif !valid_url?("#{splc_url}")
      step_b_1 = @html_doc.css("section#highlighted")
      step_b_2 = step_b_1.css("div.field-items")
      step_b_3 = step_b_2[0].children
      step_b_4 = step_b_3[1].children.text
      backup_url = step_b_4.match(/https.*\w/)[0]
        if !!valid_url?("#{backup_url}")
          backup_url
        else
          @error_url
        end
      else
        @error_url
      end
    else 
      @error_url
    end
  end
end