class Truck
  
  attr_accessor :make, :year, :color
  attr_reader :wheels
  attr_writer :doors
  
  def initialize(options={})
    self.make = options[:make] || 'Ford'
    self.year = (options[:year] || 2007).to_i
    self.color = options[:color] || 'unknown'
    @wheels = 4
  end
  
  def self.colors
    ['blue', 'black', 'red', 'green', 'white']
  end
  
  def full_name
    "#{self.year.to_s} #{self.make} Truck (#{self.color})"
  end
  
end
