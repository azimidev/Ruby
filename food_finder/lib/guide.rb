require 'readline'

require_relative('restaurant')
require_relative('support/string_extend')
require_relative('support/number_helper')

class Guide
  include NumberHelper

  @@valid_actions = ['list', 'find', 'add', 'quit']

  @@valid_sorting = ['name', 'cuisine', 'price']
  
  def initialize(path=nil)
    Restaurant.load_file(path)
  end

  def launch!
    output_introduction
    # action loop
    result = nil
    until result == :quit
      action, args = get_action
      result = do_action(action, args)
    end
    output_conclusion
  end
  
  
  private
  
    def get_action
      action = nil
      # Keep asking for user input until we get a valid action
      until @@valid_actions.include?(action)
        puts "Action not recognized." if action
        output_valid_actions
        user_response = user_input('> ')
        args = user_response.downcase.split(' ')
        action = args.shift
      end
      return action, args
    end
  
    def do_action(action, args=[])
      case action
      when 'list'
        list(args)
      when 'find'
        keyword = args.shift
        find(keyword)
      when 'add'
        add
      when 'quit'
        return :quit
      end
    end

    def list(args=[])
      output_action_header("Listing restaurants")

      sort_order = args.shift
      sort_order = args.shift if sort_order == 'by'
      sort_order = "name" unless @@valid_sorting.include?(sort_order)
    
      restaurants = Restaurant.all
      restaurants.sort! do |r1, r2|
        case sort_order
        when 'name'
          r1.name.downcase <=> r2.name.downcase
        when 'cuisine'
          r1.cuisine.downcase <=> r2.cuisine.downcase
        when 'price'
          r1.price.to_i <=> r2.price.to_i
        end
      end
      output_restaurant_table(restaurants)
      puts "Sort using: 'list cuisine' or 'list by cuisine'\n\n"
    end
  
    def find(keyword="")
      output_action_header("Find a restaurant")
      if keyword
        restaurants = Restaurant.all
        found = restaurants.select do |rest|
          rest.name.downcase.include?(keyword.downcase) || 
          rest.cuisine.downcase.include?(keyword.downcase) || 
          rest.price.to_i <= keyword.to_i
        end
        output_restaurant_table(found)
      else
        puts "Find using a key phrase to search the restaurant list."
        puts "Examples: 'find tamale', 'find Mexican', 'find mex'\n\n"
      end
    end
  
    def add
      output_action_header("Add a restaurant")
      attributes = restaurant_attribute_input
      restaurant = Restaurant.new(attributes)
      if restaurant.save
        puts "\nRestaurant Added\n\n"
      else
        puts "\nSave Error: Restaurant not added\n\n"
      end
    end
  
    def output_introduction
      puts "\n\n<<< Welcome to the Food Finder >>>\n\n"
      puts "This is an interactive guide to help you find the food you crave.\n\n"
    end

    def output_conclusion
      puts "\n<<< Goodbye and Bon Appetit! >>>\n\n\n"
    end
  
    def output_valid_actions
      puts "Actions: " + @@valid_actions.join(", ")
    end
        
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
        line << " " + number_to_currency(rest.price).rjust(6)
        puts line
      end
      puts "No listings found" if restaurants.empty?
      puts "-" * 60
    end
  
    def restaurant_attribute_input
      args = {}
      print "Restaurant name: "
      args[:name] = user_input('')

      print "Cuisine type: "
      args[:cuisine] = user_input('')

      print "Average price: "
      args[:price] = user_input('')

      return args
    end

    def user_input(prompt=nil)
      prompt ||= '> '
      result = Readline.readline(prompt, true)
      result.strip
    end

end
