class TopTravelDeals::Deal
  attr_accessor :name, :price, :offered_by, :url, :location, :summary

  @@all = []

  def initialize(name = nil, price = nil, offered_by = nil, url = nil, location = nil, summary = nil)
    @name = name
    @price = price
    @offered_by = offered_by
    @url = url
    @location = location
    @summary = summary
    save
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find(id)
    self.all[id - 1]
  end
  
end
