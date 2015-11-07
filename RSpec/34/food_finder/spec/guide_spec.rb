require 'guide'

describe Guide do

  let(:test_file) { 'spec/fixtures/restaurants_test.txt' }
  subject { Guide.new(test_file) }
  
  let(:new_file)  { 'spec/fixtures/new_restaurants_test.txt' }
  let(:new_file_path) { File.join(APP_ROOT, new_file) }
  let(:blank_guide) { Guide.new(new_file) }
  
  it 'includes NumberHelper and #number_to_currency' do
    expect(described_class.included_modules).to include(NumberHelper)
    expect(subject).to respond_to(:number_to_currency)
  end
  
  describe '#intialize' do
    
    it 'calls Restaurant#load_file with its path argument' do
      expect(Restaurant).to receive(:load_file).with(test_file)
      Guide.new(test_file)
    end
    
  end
  
  describe '#launch!' do
    
    it 'outputs a introductory message' do
      setup_fake_input('quit')
      expect { subject.launch! }.to output(/Welcome/).to_stdout
    end
    
  end

  describe 'performing actions' do
    
    context 'with invalid action' do
      
      it 'outputs list of valid actions' do
        setup_fake_input('invalid action', 'quit')
        expect do
          subject.launch!
        end.to output(/Action not recognized./).to_stdout
      end
      
    end
    
    context 'with quit action' do
      
      it 'outputs concluding message and exits' do
        setup_fake_input('quit')
        expect { subject.launch! }.to output(/Goodbye/).to_stdout
      end
      
    end

    context 'with list action' do
      
      it 'outputs a formatted list of restaurants' do
        setup_fake_input('list', 'quit')
        output = capture_output { subject.launch! }
        
        lines = output.split("\n")
        expect(lines[10]).to match(/^\sName\s{27}Cuisine\s{15}Price$/)
        expect(lines[11]).to eq("-" * 60)
        lines[12..17].each do |line|
          expect(line).to match(/^\s.+\s+.+\s+\$\d+\.\d{2}$/)
        end
        expect(lines[18]).to eq("-" * 60)
      end
      
      it 'outputs a message if no listings are found' do
        setup_fake_input('list', 'quit')
        output = capture_output { blank_guide.launch! }
        lines = output.split("\n")
        expect(lines[10]).to match(/^\sName\s{27}Cuisine\s{15}Price$/)
        expect(lines[11]).to eq("-" * 60)
        expect(lines[12]).to eq("No listings found")
        expect(lines[13]).to eq("-" * 60)
        
        # clean up
        remove_created_file(new_file_path)
      end
      
      it 'sorts alphabetically by default' do
        setup_fake_input('list', 'quit')
        output = capture_output { subject.launch! }
        lines = output.split("\n")
        # Use Regex to extract the names
        names = lines[12..17].map {|l| l.match(/^\s(.+)\s+.+\s+\$\d+\.\d{2}$/)[1]}
        # Build array with the first characters
        first_chars = names.map {|l| l[0] }
        expect(first_chars).to eq(first_chars.sort)
      end
      
      it 'sorts alphabetically with an invalid sort by' do
        setup_fake_input('list invalid', 'quit')
        output = capture_output { subject.launch! }
        lines = output.split("\n")
        # Use Regex to extract the names
        names = lines[12..17].map {|l| l.match(/^\s(.+)\s+.+\s+\$\d+\.\d{2}$/)[1]}
        # Build array with the first characters
        first_chars = names.map {|l| l[0] }
        expect(first_chars).to eq(first_chars.sort)
      end

      it 'sorts by price when asked' do
        setup_fake_input('list price', 'quit')
        output = capture_output { subject.launch! }
        lines = output.split("\n")
        prices = lines[12..17].map do |l|
          # Use Regex to extract the prices
          string = l.match(/^\s.+\s+.+\s+\$(\d+\.\d{2})$/)[1]
          # convert '150.00' to 15000 (avoids using floats)
          d, c = string.split('.')
          price = (d.to_i * 100) + c.to_i
        end
        expect(prices).to eq(prices.sort)
      end

      it 'sorts by cuisine when asked' do
        setup_fake_input('list cuisine', 'quit')
        output = capture_output { subject.launch! }
        lines = output.split("\n")
        # Use Regex to extract the cuisines
        cuisines = lines[12..17].map do |l|
          l.match(/^\s.+\s+(.+)\s+\$\d+\.\d{2}$/)[1]
        end
        expect(cuisines).to eq(cuisines.sort)
      end
      
    end

    context 'with find action' do
      
      it 'outputs instructions if no arguments given' do
        setup_fake_input('find', 'quit')
        output = capture_output { subject.launch! }
        expect(output).to include('Find using a key phrase to search the restaurant list.')
      end
      
      it 'finds restaurants with matching name keyword' do
        setup_fake_input('find cafe', 'quit')
        output = capture_output { subject.launch! }
        
        lines = output.split("\n")
        expect(lines[11]).to eq("-" * 60)
        expect(lines[12]).to include('Cafe Masala')
        expect(lines[13]).to eq("-" * 60)
      end

      it 'finds restaurants with matching cuisine keyword' do
        setup_fake_input('find mexican', 'quit')
        output = capture_output { subject.launch! }
        
        lines = output.split("\n")
        expect(lines[11]).to eq("-" * 60)
        expect(lines[12]).to include('Hot Tamale')
        expect(lines[13]).to eq("-" * 60)
      end
      
      it 'finds restaurants with prices less than keyword' do
        setup_fake_input('find 10', 'quit')
        output = capture_output { subject.launch! }
        
        lines = output.split("\n")
        expect(lines[11]).to eq("-" * 60)
        expect(lines[12]).to include('Pita Pocket')
        expect(lines[13]).to include('Quick Cup')
        expect(lines[14]).to include('Taste Of Little Italy')
        expect(lines[15]).to eq("-" * 60)
      end

    end

    context 'with add action' do

      let(:fake_file) do
        double('Fake Restaurant Instance', :save => true)
      end
      
      before(:example) do
        # keeps it from creating a new file
        allow(Restaurant).to receive(:new).with(any_args).
          and_return(fake_file)
        setup_fake_input('add', 'Chelsea Diner', 'American', '20', 'quit')
      end
      
      it 'asks questions about restaurant to add' do
        # Questions:
        # "Restaurant name: "   :name
        # "Cuisine type: "      :cuisine
        # "Average price: "     :price

        output = capture_output { subject.launch! }
        expect(output).to match(/Restaurant name:/)
        expect(output).to match(/Cuisine type:/)
        expect(output).to match(/Average price:/)
      end

      it 'sends question answers to Restaurant.new' do
        no_output { subject.launch! }
        # Because we stubbed Restaurant.new in the 
        # before(:example) block, we can spy on it here.
        expect(Restaurant).to have_received(:new).with(:name => 'Chelsea Diner', :cuisine => 'American', :price => '20')
      end

    end
    
  end

end
