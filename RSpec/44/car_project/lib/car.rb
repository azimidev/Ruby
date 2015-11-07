class Car
  
  attr_accessor :make, :year, :color
  attr_reader :wheels
  attr_accessor :doors
  
  def initialize(options={})
    self.make = options[:make] || 'Volvo'
    self.year = (options[:year] || 2007).to_i
    self.color = options[:color] || 'unknown'
    @wheels = 4
    self.doors = options[:doors] || 4
    self.doors = 4 unless [2,4].include?(doors)
  end
  
  def self.colors
    ['blue', 'black', 'red', 'green']
  end
  
  def full_name
    "#{self.year.to_s} #{self.make} (#{self.color})"
  end
  
end
