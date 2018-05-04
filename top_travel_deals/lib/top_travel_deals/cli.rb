#Our CLI Controller
class TopTravelDeals::CLI


  def call
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~".colorize(:yellow)
    puts "                                                                             "
    puts "                   Welcome to Top Travel Deals!                              ".colorize(:yellow)
    puts "                                                                             "
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~".colorize(:yellow)
    TopTravelDeals::Scraper.scrape_list
    list_deals
    start
  end


  def list_deals
    puts " "
    puts "Here's the Top 20 Travel Deals for this week!".colorize(:yellow)
    puts " "
    TopTravelDeals::Deal.all.each.with_index(1) do |trip, index|
      puts "#{index}. #{trip.name}.....only #{trip.price}".colorize(:yellow)
    end
    puts "----------------------------------------------------------------------------------".colorize(:yellow)
  end


  def start
    puts " "
    puts "Enter the number of the deal you'd like to see.".colorize(:blue)
    input = gets.strip.to_i
    until input.between?(1,TopTravelDeals::Deal.all.size)
      puts "That's not a valid option. Please enter a number between 1-20".colorize(:blue)
      input = gets.strip.to_i
    end

    choice = TopTravelDeals::Deal.find(input)
    puts " "
    puts "----------------------------------------------------------------------------------".colorize(:yellow)
    puts "You chose number #{input}. #{choice.name}. This is a GREAT DEAL!".colorize(:yellow)
    puts "Here's some of the details: ".colorize(:yellow)
    puts "----------------------------------------------------------------------------------".colorize(:yellow)
    puts " "
    print_deal(choice)

    puts " "
    puts "Would you like to find out more? Enter 'Yes' or 'No' (Y/N).".colorize(:blue)
    more_info = gets.strip.upcase
    until more_info == "Y" || more_info == "YES" || more_info == "N" || more_info == "NO"
      puts "That's not a valid answer, please enter 'Yes' or 'No' (Y/N).".colorize(:blue)
      more_info = gets.strip.upcase
    end
    if more_info == "Y" || more_info == "YES"
      TopTravelDeals::Scraper.scrape_description(TopTravelDeals::Deal.find(input))
      print_description(choice)
    end

    puts "Would you like to see another deal? Enter 'Yes' or 'No' (Y/N).".colorize(:blue)
    see_another = gets.strip.upcase
    until see_another == "Y" || see_another == "YES" || see_another == "N" || see_another == "NO"
      puts "That's not a valid answer, please enter 'Yes' or 'No' (Y/N).".colorize(:blue)
      see_another = gets.strip.upcase
    end
    if see_another == "Y" || see_another == "YES"
      list_deals
      start
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

  def print_description(choice)
    puts "----------------------------------------------------------------------------------".colorize(:yellow)
    puts "                       #{choice.name}                      ".colorize(:yellow)
    puts "----------------------------------------------------------------------------------".colorize(:yellow)
    puts "#{choice.summary}".colorize(:yellow)
    puts " "
    puts "----------------------------------------------------------------------------------".colorize(:yellow)
  end

  def goodbye
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~".colorize(:red)
    puts "Goodbye! Come back soon to see more Top Travel Deals!!".colorize(:red)
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~".colorize(:red)
  end

end
