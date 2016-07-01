class View

  class HelpError < StandardError
  end

  def display_descriptions(restaurants)
    restaurants.each do |violation|
      puts
      puts "These are the violations for #{violation["dba"]} on #{violation["inspection_date"]}:"
      puts "-" * 80
      puts violation["violation_description"]
      puts
    end
  end

  def argv_helper
    if ARGV[0] == "help"
      puts "Desired input format: Burrough Zipcode Restaurant"
      puts "TIP: if you don't want to use one of the search fields, type 'n/a' for that field."
      raise HelpError
    elsif ARGV[0] == "restaurant of the year"
      return "restaurant of the year"
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
