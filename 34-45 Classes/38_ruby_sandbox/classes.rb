class Animal
  attr_accessor :name
  attr_writer :color
  attr_reader :legs, :arms
  
  def setup_limbs
    @legs = 4
    @arms = 0
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

animal1 = Animal.new
animal1.setup_limbs
animal1.noise = "Moo!"
animal1.name = "Steve"
puts animal1.name
animal1.color = "black"
puts animal1.color
puts animal1.legs
puts animal1.noise

animal2 = Animal.new
animal2.noise = "Quack!"
puts animal2.noise
