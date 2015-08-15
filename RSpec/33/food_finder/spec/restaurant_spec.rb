require 'restaurant'

describe Restaurant do

  let(:test_file) { 'spec/fixtures/restaurants_test.txt' }
  let(:crescent) { Restaurant.new(:name => 'Crescent', :cuisine => 'paleo', :price => '321') }
  
  describe 'attributes' do
  
    it "allow reading and writing for :name"

    it "allow reading and writing for :cuisine"

    it "allow reading and writing for :price"
    
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
      pending
      Restaurant.load_file(test_file)
      restaurants = Restaurant.all
      expect(restaurants.class).to eq('FIXME')
      expect(restaurants.length).to eq('FIXME')
      expect(restaurants.first.class).to eq('FIXME')
    end

    it 'returns an empty array when @@file is nil' do
      pending
      no_output { Restaurant.load_file(nil) }
      restaurants = Restaurant.all
      expect(restaurants).to eq('FIXME')
    end
    
  end
  
  describe '#initialize' do

    context 'with no options' do
      # subject would return the same thing
      let(:no_options) { Restaurant.new }

      it 'sets a default of "" for :name'

      it 'sets a default of "unknown" for :cuisine'

      it 'does not set a default for :price'
    end
    
    context 'with custom options' do
      
      it 'allows setting the :name'

      it 'allows setting the :cuisine'

      it 'allows setting the :price'

    end

  end
  
  describe '#save' do
    
    it 'returns false if @@file is nil'
    
    it 'returns false if not valid'
    
    it 'calls append on @@file if valid'
    
  end
  
  describe '#valid?' do
    
    it 'returns false if name is nil'

    it 'returns false if name is blank'

    it 'returns false if cuisine is nil'

    it 'returns false if cuisine is blank'
    
    it 'returns false if price is nil'

    it 'returns false if price is 0'
    
    it 'returns false if price is negative'

    it 'returns true if name, cuisine, price are present'
    
  end

end
