require 'pry'

class TopTravelDeals::Scraper

  #deal list div class deal-info clearfix".text
  #number i class "top20-numbers icon-top20_badge"
  #price- doc.search("span.deal-headline-price").text
  #trip-  doc.search("span.deal-headline-text").text
  #location p class "h6 deal-location"
  #summary- doc.search("p.deal-summary").text

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

  def self.scrape_description(choice_url)
    detail = Nokogiri::HTML(open(choice_url))
      #system("open'#{choice_url}'")
    summary = detail.search("div.section").text.strip

    title = detail.search("title").text
    puts "---------------------------------------------------------------------------------------------------".colorize(:yellow)
    puts "                       #{title}                      ".colorize(:yellow)
    puts "---------------------------------------------------------------------------------------------------".colorize(:yellow)
    puts "#{summary}".colorize(:yellow)
    puts " "
    puts "---------------------------------------------------------------------------------------------------".colorize(:yellow)
  end
end
