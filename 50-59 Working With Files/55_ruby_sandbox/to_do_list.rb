class ToDoList

  include Enumerable
  
	attr_accessor :items
	
	def initialize
	  @items = []
  end
  
  def each
    @items.each {|item| yield item}
  end
  
end

# list = ToDoList.new
# list.items = ['laundry', 'dishes', 'vacuum']
# list.items.select {|i| i.length > 6 }