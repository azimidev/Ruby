class Animal
  attr_accessor :name
  attr_writer :color
  attr_reader :legs, :arms
  
  def initialize(noise, legs=4, arms=0)
    @noise = noise
    @legs = legs
    @arms = arms
    puts "A new animal has been instantiated."
  end
  
  def noise=(noise)
    @noise = noise
  end
  
  def noise
    @noise
  end
  
  def color
    "The color is #{@color}."
  end
end

animal1 = Animal.new("Moo!", 4, 0)
animal1.name = "Steve"
puts animal1.name
animal1.color = "black"
puts animal1.color
puts animal1.legs
puts animal1.noise

animal2 = Animal.new("Quack!")
puts animal2.noise
