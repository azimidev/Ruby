class Animal
  def set_noise(noise)
    @noise = noise
  end
  
  def make_noise
    @noise
  end
end

animal1 = Animal.new
animal1.set_noise("Moo!")
puts animal1.make_noise

animal2 = Animal.new
animal2.set_noise("Quack!")
puts animal2.make_noise
