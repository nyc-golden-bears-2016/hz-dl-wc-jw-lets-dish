require 'open-uri'
require 'JSON'

class InspectionSorter

  attr_reader :violations

  def initialize
    @violations = get_current_violations
  end


  def get_current_violations
    violations = JSON.parse(open("https://data.cityofnewyork.us/resource/9w7m-hzhe.json").read)
    violations.each do |row|
      row["inspection_date"] = Time.parse(row["inspection_date"])
    end

    current_violations = violations.select { |row| row["inspection_date"] >= Time.new("2016-01-01")}
    # current_violations.each do |row|
    #   puts row["inspection_date"]
    # end
  end

  def restaurant_of_the_year
    restaurant = @violations.min_by do |row|
      if row["score"].nil?
        100
      else
        row["score"].to_i
      end
    end
    p restaurant
  end

  def get_violations(options)
    filtered = @violations
    if !(options['restaurant'].nil?)
      filtered = by_restaurant(filtered)
    end
    if !(options['burrough'].nil?)
      filtered = by_burrough(filtered)
    end
    if !(options['zipcode'].nil?)
      filtered = by_zip(filtered)
    end
    filtered
  end

  private

  def by_restaurant(restaurant)
    @violations.select { |row| row["dba"].upcase == restaurant.upcase }
  end

  def by_burrough(burrough)
    @violations.select { |row| row["boro"].upcase == burrough.upcase }
  end

  def by_zip(zip)
    @violations.select { |row| row["zipcode"] == zip }
  end

end
