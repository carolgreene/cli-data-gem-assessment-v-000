#Our CLI Controller
class TopTravelDeals::CLI




  def call
    puts "---------------------------------------------------------------------------------------------------".colorize(:yellow)
    puts "                                                                             "
    puts "                   Welcome to Top Travel Deals!                              ".colorize(:yellow)
    puts "                                                                             "
    puts "---------------------------------------------------------------------------------------------------".colorize(:yellow)
    TopTravelDeals::Scraper.scrape_list
    list_deals
    menu
  end

  def list_deals
    puts " "
    puts "Here's the Top 20 Travel Deals for this week!".colorize(:yellow)
    puts " "
    TopTravelDeals::Deal.all.each.with_index(1) do |trip, index|
      puts "#{index}. #{trip.name}.....only #{trip.price}".colorize(:yellow)
    end
    puts "---------------------------------------------------------------------------------------------------".colorize(:yellow)
  end

  def menu
    puts " "
    puts "Enter the number of the deal you'd like to see.".colorize(:blue)
    input = gets.strip.to_i
    #if input = "exit"
      #goodbye
    #end
     until input.between?(1,TopTravelDeals::Deal.all.size)
       puts "That's not a valid option. Please enter a number between 1-20".colorize(:blue)
       input = gets.strip.to_i
     end

    choice = TopTravelDeals::Deal.find(input)

    puts " "
    puts "---------------------------------------------------------------------------------------------------".colorize(:yellow)
    puts "You chose number #{input}. #{choice.name}. This is a GREAT DEAL!".colorize(:yellow)
    puts "Here's some of the details: ".colorize(:yellow)
    puts "---------------------------------------------------------------------------------------------------".colorize(:yellow)
    puts " "

    print_deal(choice)
    puts " "
    puts "would you like to find out more?".colorize(:blue)
    answer = gets.strip.upcase
    if answer == "Y" || answer == "YES"
      choice_url = choice.url
      TopTravelDeals::Scraper.scrape_description(choice_url)
    end

    puts "Would you like to see another deal?".colorize(:blue)

    answer1 = gets.strip.upcase
    if answer1 == "Y" || answer1 == "YES"
      list_deals
      menu
    else
      goodbye
    end
  end

  def print_deal(choice)
    puts "#{choice.name}".colorize(:yellow)
    puts "Location.....#{choice.location}".colorize(:yellow)
    puts "Price........#{choice.price}".colorize(:yellow)
    puts "Offered By...#{choice.offered_by}".colorize(:yellow)
    puts "Webpage......#{choice.url}".colorize(:yellow)
  end

  def goodbye
    puts "Goodbye! Come back soon to see more Top Travel Deals!!".colorize(:blue)
  end

  #def self.scrape_list
    #should return a list of instances of the travel deals
    #doc = Nokogiri::HTML(open("https://www.travelzoo.com/top20/?pageType=Homepage"))
    #doc.search(".deal-card a").each do |info|
      #deal = TopTravelDeals::Deal.new
      #deal.name = info.search("span.deal-headline-text").text
      #deal.price = info.search("span.deal-headline-price").text
      #deal.url = "#{info.attr('href')}"
      #deal.offered_by = info.search("p.h6.deal-source").text
      #deal.location = info.search("p.h6.deal-location").text
    #end
  #end

    #def self.scrape_description(choice_url)
      #detail = Nokogiri::HTML(open(choice_url))
        #system("open'#{choice_url}'")
    #  summary = detail.search("div.section").text.strip

      #title = detail.search("title").text
      #puts "---------------------------------------------------------------------------------------------------".colorize(:yellow)
      #puts "                       #{title}                      ".colorize(:yellow)
      #puts "---------------------------------------------------------------------------------------------------".colorize(:yellow)
      #puts "#{summary}".colorize(:yellow)
      #puts " "
      #puts "---------------------------------------------------------------------------------------------------".colorize(:yellow)
    #end



#The Deal = detail.search("div.section h2").text

#Summary = detail.search("div.section p").text   Have some extra stuff in there that will have to figure out how to get rid of.

end
