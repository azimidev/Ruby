require 'restaurant'
require 'support/string_extend'
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
      list
    when 'find'
      find
    when 'add'
      add
    when 'quit'
      return :quit
    else
      puts "\nI don't understand that command.\n"
    end
  end

  def list
    output_action_header("Listing restaurants")
    restaurants = Restaurant.saved_restaurants
    output_restaurant_table(restaurants)
  end
  
  def find
    output_action_header("Find a restaurant")
    
  end
  
  def add
    output_action_header("Add a restaurant")
    restaurant = Restaurant.build_using_questions
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
	
	private
	
	def output_action_header(text)
	  puts "\n#{text.upcase.center(60)}\n\n"
	end
	
	def output_restaurant_table(restaurants=[])
    print " " + "Name".ljust(30)
    print " " + "Cuisine".ljust(20)
    print " " + "Price".rjust(6) + "\n"
    puts "-" * 60
    restaurants.each do |rest|
      line =  " " << rest.name.titleize.ljust(30)
      line << " " + rest.cuisine.titleize.ljust(20)
      line << " " + rest.formatted_price.rjust(6)
      puts line
    end
    puts "No listings found" if restaurants.empty?
    puts "-" * 60
  end
  
end
