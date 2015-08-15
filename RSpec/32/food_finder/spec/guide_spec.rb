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
      skip('Needs expectation')
      Guide.new(test_file)
      # expect ...
    end
    
  end
  
  describe '#launch!' do
    
    it 'outputs a introductory message' do
      skip('Needs expectation')
      setup_fake_input('quit')
      # expect ...
    end
    
  end

  describe 'performing actions' do
    
    context 'with invalid action' do
      
      it 'outputs list of valid actions' do
        skip('Needs expectation')
        setup_fake_input('invalid action', 'quit')
        # expect ...
      end
      
    end
    
    context 'with quit action' do
      
      it 'outputs concluding message and exits' do
        skip('Needs expectation')
        setup_fake_input('quit')
        # expect ...
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
        skip("Needs expectation")
        setup_fake_input('list', 'quit')
        output = capture_output { blank_guide.launch! }
        lines = output.split("\n")
        expect(lines[10]).to match(/^\sName\s{27}Cuisine\s{15}Price$/)
        expect(lines[11]).to eq("-" * 60)
        # expect(lines[12]).to ...
        expect(lines[13]).to eq("-" * 60)
        
        # clean up
        remove_created_file(new_file_path)
      end
      
      it 'sorts alphabetically by default' do
        skip('Needs expectation')
        setup_fake_input('list', 'quit')
        output = capture_output { subject.launch! }
        lines = output.split("\n")
        # Use Regex to extract the names
        names = lines[12..17].map {|l| l.match(/^\s(.+)\s+.+\s+\$\d+\.\d{2}$/)[1]}
        # Build array with the first characters
        first_chars = names.map {|l| l[0] }
        # expect(first_chars).to ...
      end
      
      it 'sorts alphabetically with an invalid sort by' do
        skip('Needs expectation')
        setup_fake_input('list invalid', 'quit')
        output = capture_output { subject.launch! }
        lines = output.split("\n")
        # Use Regex to extract the names
        names = lines[12..17].map {|l| l.match(/^\s(.+)\s+.+\s+\$\d+\.\d{2}$/)[1]}
        # Build array with the first characters
        first_chars = names.map {|l| l[0] }
        # expect(first_chars).to ...
      end

      it 'sorts by price when asked' do
        skip('Needs expectation')
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
        # expect(prices).to ...
      end

      it 'sorts by cuisine when asked' do
        skip('Needs expectation')
        setup_fake_input('list cuisine', 'quit')
        output = capture_output { subject.launch! }
        lines = output.split("\n")
        # Use Regex to extract the cuisines
        cuisines = lines[12..17].map do |l|
          l.match(/^\s.+\s+(.+)\s+\$\d+\.\d{2}$/)[1]
        end
        # expect(cuisines).to ...
      end
      
    end

    context 'with find action' do
      
      it 'outputs instructions if no arguments given' do
        skip('Needs expectation')
        setup_fake_input('find', 'quit')
        output = capture_output { subject.launch! }
        # expect(output).to ...
      end
      
      it 'finds restaurants with matching name keyword' do
        skip('Needs expectation')
        setup_fake_input('find cafe', 'quit')
        output = capture_output { subject.launch! }
        
        lines = output.split("\n")
        expect(lines[11]).to eq("-" * 60)
        # expect(lines[12]).to ...
        expect(lines[13]).to eq("-" * 60)
      end

      it 'finds restaurants with matching cuisine keyword' do
        skip('Needs expectation')
        setup_fake_input('find mexican', 'quit')
        output = capture_output { subject.launch! }
        
        lines = output.split("\n")
        expect(lines[11]).to eq("-" * 60)
        # expect(lines[12]).to ...
        expect(lines[13]).to eq("-" * 60)
      end
      
      it 'finds restaurants with prices less than keyword' do
        skip('Needs expectation')
        setup_fake_input('find 10', 'quit')
        output = capture_output { subject.launch! }
        
        lines = output.split("\n")
        expect(lines[11]).to eq("-" * 60)
        # expect(lines[12]).to ...
        # expect(lines[13]).to ...
        # expect(lines[14]).to ...
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
        # expect(output).to match(...)
        # expect(output).to match(...)
        # expect(output).to match(...)
      end

      it 'sends question answers to Restaurant.new' do
        skip("Needs expectation")
        subject.launch!
        # expect(Restaurant).to ...
      end

    end
    
  end

end
