require 'restaurant'
class Guide
  class Config
    @@actions = ['list', 'find', 'add', 'quit']
    def self.actions; @@actions; end
  end
  
  def initialize(path=nil)
    # locate the restaurant text file at path
    Restaurant.filepath = path
    if Restaurant.file_usable?
      puts "Found restaurant file."
    # or create a new file
    elsif Restaurant.create_file
      puts "Created restaurant file."
    # exit if create fails
    else
      puts "Exiting.\n\n"
      exit!
    end
  end

  def launch!
    introduction
    # action loop
    result = nil
    until result == :quit
      action = get_action
      result = do_action(action)
    end
		conclusion
  end
  
  def get_action
    action = nil
    # Keep asking for user input until we get a valid action
    until Guide::Config.actions.include?(action)
      puts "Actions: " + Guide::Config.actions.join(", ")
      print "> "
      user_response = gets.chomp
      action = user_response.downcase.strip
    end
    return action
  end
  
  def do_action(action)
    case action
    when 'list'
      puts "Listing..."
    when 'find'
      puts 'Finding...'
    when 'add'
      add
    when 'quit'
      return :quit
    else
      puts "\nI don't understand that command.\n"
    end
  end

  def add
    puts "\nAdd a restaurant\n\n".upcase
    restaurant = Restaurant.new
    
    print "Restaurant name: "
    restaurant.name = gets.chomp.strip

    print "Cuisine type: "
    restaurant.cuisine = gets.chomp.strip
    
    print "Average price: "
    restaurant.price = gets.chomp.strip
    
    if restaurant.save
      puts "\nRestaurant Added\n\n"
    else
      puts "\nSave Error: Restaurant not added\n\n"
    end
    
  end
  
  def introduction
    puts "\n\n<<< Welcome to the Food Finder >>>\n\n"
    puts "This is an interactive guide to help you find the food you crave.\n\n"
  end

	def conclusion
  	puts "\n<<< Goodbye and Bon Appetit! >>>\n\n\n"
	end
	
end
