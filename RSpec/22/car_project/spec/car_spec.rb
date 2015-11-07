require 'car'

describe 'Car' do

  describe 'attributes' do
    
    subject { Car.new }
    
    # use "subject" instead of "let"
    # if variable is subject of example
    # let(:car) { Car.new }

    # "let" is better than "before" for 
    # setting up instance variables
    # before(:example) do
    #   @car = Car.new
    # end
    
    it "allows reading and writing for :make" do
      subject.make = 'Test'
      expect(subject.make).to eq('Test')
    end
    
    it "allows reading and writing for :year" do
      subject.year = 9999
      expect(subject.year).to eq(9999)
    end
    
    it "allows reading and writing for :color" do
      subject.color = 'foo'
      expect(subject.color).to eq('foo')
    end
    
    it "allows reading for :wheels" do
      expect(subject.wheels).to eq(4)
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
