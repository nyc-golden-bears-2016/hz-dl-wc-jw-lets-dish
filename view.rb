class View

  class HelpError < StandardError
  end

  def display_descriptions(restaurants)
    if restaurants.kind_of?(Hash)
      if !(restaurants[:banned].nil?)
        puts
        puts 
        puts "Ejay Smith - assault ON 2016-05-23 00:00:00 -0400"
        puts "Prajay Soni - indecent exposure ON 2016-05-04 00:00:00 -0400"
        puts "Michael Johnson - assault ON 2016-02-21 00:00:00 -0400"
        puts "Brad Stephens - public intoxication ON 2016-01-29 00:00:00 -0400"
        puts "Michael Reys - assault ON 2016-01-11 00:00:00 -0400"
        puts
      else
        puts
        puts "These are the violations for #{restaurants["dba"]} on #{restaurants["inspection_date"]}:"
        puts "-" * 80
        puts restaurants["violation_description"]
        puts
      end
    else
      restaurants.each do |violation|
        puts
        puts "These are the violations for #{violation["dba"]} on #{violation["inspection_date"]}:"
        puts "-" * 80
        puts violation["violation_description"]
        puts
      end
    end
  end

  def argv_helper
    if ARGV[0] == "help"
      puts "Desired input format: Burrough Zipcode Restaurant"
      puts "TIP: if you don't want to use one of the search fields, type 'n/a' for that field."
      raise HelpError
    elsif ARGV[0] == "restaurant of the year"
      return "restaurant of the year"
    elsif ARGV[0] == "banned patrons wendy's 10001"
      return "banned patrons wendy's"
    else
      options = {}
      ARGV.each_with_index do |option, index|
        case index
        when 0
          options["burrough"] = option unless option == "n/a"
        when 1
          options["zipcode"] = option unless option == "n/a"
        when 2
          options["restaurant"] = option unless option == "n/a"
        end
      end
    end
    options
  end

end
