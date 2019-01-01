require 'date'
require 'nokogiri'
require 'rest-client'

module R18Client
  HOST = 'http://www.r18.com/common/search/'
  
  class Client
    attr_reader :success

    def load(code)
      response = RestClient.get(HOST, {params: {searchword: code}}).body
      @doc = Nokogiri::HTML(response)

      if @doc.text.include?('Unable to find related item for')
        @success = false
      else
        url = @doc.at_css('.cmn-list-product01 a').attr('href')
        @doc = Nokogiri::HTML(RestClient.get(url).body)
        @success = true
      end
    end
    
    def title
      title = @doc.at_css('.product-details-page cite').content
      if self.cast.length == 1
        name = self.cast[0].split.join(' ')
        title = title.reverse.sub(name.reverse, '').reverse
      end
      title.strip
    end

    def cast
      @doc.css('.product-actress-list [itemprop="name"]').map(&:content)
    end

    def release_date
      date = DateTime.parse @doc.at_css('[itemprop="dateCreated"]').content
      date.strftime '%Y-%m-%d'
    end

    def genres
      @doc.css('[itemprop="genre"]').map { |el| el.content.strip }
    end

    def cover
      @doc.at_css('.detail-single-picture img').attr('src')
    end
  end
end
