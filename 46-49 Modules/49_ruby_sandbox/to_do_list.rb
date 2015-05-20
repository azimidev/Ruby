class ToDoList

	include Enumerable #1. include Enumerable

	attr_accessor :items
	
	def initialize
		@items = []
	end

	# 2.Use each 
	def each
		@items.each {|item| yield item}
	end

end

# list = ToDoList.new
# list.items = ['laundry', 'dishes', 'vacuum']
# list.items.select {|i| i.length > 6 }