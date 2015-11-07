require 'car'

describe 'Car' do

  describe 'attributes' do
    
    let(:car) { Car.new }

    # "let" is better than "before" for 
    # setting up instance variables
    # before(:example) do
    #   @car = Car.new
    # end
    
    it "allows reading and writing for :make" do
      car.make = 'Test'
      expect(car.make).to eq('Test')
    end
    
    it "allows reading and writing for :year" do
      car.year = 9999
      expect(car.year).to eq(9999)
    end
    
    it "allows reading and writing for :color" do
      car.color = 'foo'
      expect(car.color).to eq('foo')
    end
    
    it "allows reading for :wheels" do
      expect(car.wheels).to eq(4)
    end
    
    it "allows writing for :doors"
    
  end
  
  describe '.colors' do

    let(:colors) { ['blue', 'black', 'red', 'green'] }
    
    it "returns an array of color names" do
      expect(Car.colors).to match_array(colors)
    end

  end
  
  describe '#full_name' do
    
    let(:honda) { Car.new(:make => 'Honda', :year => 2004, :color => 'blue') }
    let(:new_car) { Car.new }

    it "returns a string in the expected format" do
      expect(honda.full_name).to eq('2004 Honda (blue)')
    end
    
    context 'when initialized with no arguments' do
      it 'returns a string using default values' do
        expect(new_car.full_name).to eq('2007 Volvo (unknown)')
      end
    end

  end

end
