class TopTravelDeals::Deal
  attr_accessor :name, :price, :offered_by, :url, :location

  @@all = []

  def initialize(name = nil, price = nil, offered_by = nil, url = nil, location = nil)
    @name = name
    @price = price
    @offered_by = offered_by
    @url = url
    @location = location
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

  def self.find_by_name(name)
    @@all.detect do |deal|
      deal.name.downcase.strip == name.downcase.strip
    end
  end

end
