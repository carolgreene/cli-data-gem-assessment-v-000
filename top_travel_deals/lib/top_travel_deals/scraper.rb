
require 'pry'

class TopTravelDeals::Scraper


  def self.scrape_list
    #should return a list of instances of the travel deals
    doc = Nokogiri::HTML(open("https://www.travelzoo.com/top20/?pageType=Homepage"))
    doc.search(".deal-card a").each do |info|
      deal = TopTravelDeals::Deal.new
      deal.name = info.search("span.deal-headline-text").text
      deal.price = info.search("span.deal-headline-price").text
      deal.url = "#{info.attr('href')}"
      deal.offered_by = info.search("p.h6.deal-source").text
      deal.location = info.search("p.h6.deal-location").text
    end
  end

  def self.scrape_description(deal)
    detail = Nokogiri::HTML(open(deal.url))
      #system("open'#{deal_url}'")
    deal.summary = detail.search("div.section").text.strip
  end
end
