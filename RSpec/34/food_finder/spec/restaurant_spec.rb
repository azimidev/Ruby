require 'restaurant'

describe Restaurant do

  let(:test_file) { 'spec/fixtures/restaurants_test.txt' }
  let(:crescent) { Restaurant.new(:name => 'Crescent', :cuisine => 'paleo', :price => '321') }
  
  describe 'attributes' do
  
    it "allow reading and writing for :name" do
      subject.name = 'Test'
      expect(subject.name).to eq('Test')
    end

    it "allow reading and writing for :cuisine" do
      subject.cuisine = 'Martian'
      expect(subject.cuisine).to eq('Martian')
    end

    it "allow reading and writing for :price" do
      subject.price = '123'
      expect(subject.price).to eq('123')
    end
    
  end
  
  describe '.load_file' do

    it 'does not set @@file if filepath is nil' do
      no_output { Restaurant.load_file(nil) }
      expect(Restaurant.file).to be_nil
    end
    
    it 'sets @@file if filepath is usable' do
      no_output { Restaurant.load_file(test_file) }
      expect(Restaurant.file).not_to be_nil
      expect(Restaurant.file.class).to be(RestaurantFile)
      expect(Restaurant.file).to be_usable
    end

    it 'outputs a message if filepath is not usable' do
      expect do
        Restaurant.load_file(nil)
      end.to output(/not usable/).to_stdout
    end
    
    it 'does not output a message if filepath is usable' do
      expect do
        Restaurant.load_file(test_file)
      end.not_to output.to_stdout
    end
    
  end
  
  describe '.all' do
    
    it 'returns array of restaurant objects from @@file' do
      Restaurant.load_file(test_file)
      restaurants = Restaurant.all
      expect(restaurants.class).to eq(Array)
      expect(restaurants.length).to eq(6)
      expect(restaurants.first.class).to eq(Restaurant)
    end

    it 'returns an empty array when @@file is nil' do
      no_output { Restaurant.load_file(nil) }
      restaurants = Restaurant.all
      expect(restaurants).to eq([])
    end
    
  end
  
  describe '#initialize' do

    context 'with no options' do
      # subject would return the same thing
      let(:no_options) { Restaurant.new }

      # subject already calls #new using 
      # default options; we can use it

      it 'sets a default of "" for :name' do
        expect(subject.name).to eq("")
      end

      it 'sets a default of "unknown" for :cuisine' do
        expect(subject.cuisine).to eq("unknown")
      end

      it 'does not set a default for :price' do
        expect(subject.price).to be_nil
      end

    end
    
    context 'with custom options' do
      
      # crescent already calls #new using 
      # custom options; we can use it
      
      it 'allows changing the :name' do
        expect(crescent.name).to eq("Crescent")
      end

      it 'allows changing the :cuisine' do
        expect(crescent.cuisine).to eq("paleo")
      end

      it 'allows changing the :price' do
        expect(crescent.price).to eq('321')
      end

    end

  end
  
  describe '#save' do
    
    it 'returns false if @@file is nil' do
      # Don't load a file here
      expect(Restaurant.file).to be_nil
      
      expect(crescent.save).to be false
    end
    
    it 'returns false if not valid' do
      Restaurant.load_file(test_file)
      expect(Restaurant.file).not_to be_nil
      
      # subject will be invalid by default
      expect(subject.save).to be false
    end
    
    it 'calls append on @@file if valid' do
      Restaurant.load_file(test_file)
      expect(Restaurant.file).not_to be_nil
      
      # Message expectation on partial test double
      expect(Restaurant.file).to receive(:append).with(crescent)
      crescent.save
    end
    
  end
  
  describe '#valid?' do
    
    it 'returns false if name is nil' do
      crescent.name = nil
      expect(crescent.valid?).to be false
    end

    it 'returns false if name is blank' do
      crescent.name = '   '
      expect(crescent.valid?).to be false
    end

    it 'returns false if cuisine is nil' do
      crescent.cuisine = nil
      expect(crescent.valid?).to be false
    end

    it 'returns false if cuisine is blank' do
      crescent.cuisine = '   '
      expect(crescent.valid?).to be false
    end
    
    it 'returns false if price is nil' do
      crescent.price = nil
      expect(crescent.valid?).to be false
    end

    it 'returns false if price is 0' do
      crescent.price = 0
      expect(crescent.valid?).to be false
    end
    
    it 'returns false if price is negative' do
      crescent.price = -10
      expect(crescent.valid?).to be false
    end

    it 'returns true if name, cuisine, price are present' do
      expect(crescent.valid?).to be true
    end
    
  end

end
