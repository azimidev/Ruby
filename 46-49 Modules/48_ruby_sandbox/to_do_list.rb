class ToDoList

	attr_accessor :items
	
	def initialize
	  @items = []
  end
  
end

# list = ToDoList.new
# list.items = ['laundry', 'dishes', 'vacuum']
# list.items.select {|i| i.length > 6 }