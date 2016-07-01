require 'open-uri'
require 'JSON'

module InspectionSorter

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

  def get_violations(data)

  end

  def by_restaurant(data)

  end

  def method_name

  end



end
