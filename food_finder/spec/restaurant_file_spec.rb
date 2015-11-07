require 'restaurant_file'

describe RestaurantFile do

  let(:test_file) { 'spec/fixtures/restaurants_test.txt' }
  let(:test_file_path) { File.join(APP_ROOT, test_file) }
  let(:valid_file) { RestaurantFile.new(:filepath => test_file) }
  
  let(:new_file)  { 'spec/fixtures/new_restaurants_test.txt' }
  let(:new_file_path) { File.join(APP_ROOT, new_file) }
  let(:blank_file) { RestaurantFile.new(:filepath => new_file) }

  describe '#initialize' do
    
    it "returns an instance when given no options" do
      expect(subject).not_to be_nil
      expect(subject.class).to eq(RestaurantFile)
    end

    it 'uses :filepath option to locate a valid file' do
      expect(valid_file.exists?).to be_truthy
    end
    
  end

  describe '#filepath=' do
  
    it "does nothing if path is nil" do
      subject.filepath = nil
      expect(subject.exists?).to be_falsey
    end
    
    it "locates an existing file" do
      subject.filepath = test_file
      expect(subject.exists?).to be_truthy
    end

    it "creates a new file if none exists" do
      # Make sure file is not present
      remove_created_file(new_file_path)
      expect(File.exists?(new_file_path)).to be_falsey
      subject.filepath = new_file
      expect(File.exists?(new_file_path)).to be_truthy
      remove_created_file(new_file_path)
    end
  
  end
  
  describe '#exists?' do
    
    it 'returns nil (falsey) when @filepath is nil' do
      expect(subject.exists?).to be_nil
    end

    it 'returns false if @filepath file does not exist' do
      # To @filepath set but not have it exist, 
      # we allow it to be auto-created, 
      # and then forcibly delete it.
      blank_file
      remove_created_file(new_file_path)
      expect(blank_file.exists?).to be false
    end
    
    it 'returns true when @filepath points to an existing file' do
      expect(valid_file.exists?).to be true
    end
    
  end

  describe '#readable?' do
    
    it 'returns nil (falsey) when @filepath is nil' do
      expect(subject.readable?).to be_nil
    end

    it 'returns true when @filepath points to a readable file' do
      expect(valid_file.readable?).to be true
    end
    
  end

  describe '#writable?' do
    
    it 'returns nil (falsey) when @filepath is nil' do
      expect(subject.writable?).to be_nil
    end

    it 'returns true when @filepath points to a writable file' do
      expect(valid_file.writable?).to be true
    end
    
  end
  
  describe '#usable?' do

    # Do not need to test each of the "false" cases
    # Would just be re-testing #exists?, #readable?, #writable?
    # But let's still test the true" case.
    
    it 'returns true when @filepath is existing/readable/writable file' do
      expect(valid_file.usable?).to be true
    end
    
  end
  
  describe '#read' do

    it 'returns an array of restaurant objects' do
      restaurants = valid_file.read
      expect(restaurants.class).to eq(Array)
      expect(restaurants.length).to eq(6)
      expect(restaurants.first.class).to eq(Restaurant)
    end
    
    it 'returns an empty array if file is not specified' do
      expect(subject.read).to eq([])
    end

    it 'returns an empty array if file is empty' do
      expect(blank_file.read).to eq([])
      remove_created_file(new_file_path)
    end
    
  end
  
  describe '#append' do

    it 'adds a restaurant to the end of the file' do
      # force creation of a new file
      blank_file
      contents = File.read(new_file_path)
      last_row = contents.split("\n").last
      expect(last_row).to be_nil

      restaurant = Restaurant.new(:name => 'Starducks', :cuisine => 'coffee', :price => '5')
      blank_file.append(restaurant)

      contents = File.read(new_file_path)
      last_row = contents.split("\n").last
      expect(last_row).to eq("Starducks\tcoffee\t5")
      
      remove_created_file(new_file_path)
    end
  
  end
  
end
