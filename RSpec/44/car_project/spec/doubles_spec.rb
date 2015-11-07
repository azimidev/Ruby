describe 'Doubles' do

  it "allows stubbing methods" do
    dbl = double("Chant")
    allow(dbl).to receive(:hey!)
    expect(dbl).to respond_to(:hey!)
  end

  it "allows stubbing a response with a block" do
    dbl = double("Chant")
    # When I say 'Hey!', you say 'Ho!'
    allow(dbl).to receive(:hey!) { "Ho!" }
    # "Hey!", "Ho!"
    expect(dbl.hey!).to eq("Ho!")
  end

  it "allows stubbing responses with #and_return" do
    dbl = double("Chant")
    # This is my perferred syntax
    # When I say 'Hey!', you say 'Ho!'
    allow(dbl).to receive(:hey!).and_return("Ho!")
    # "Hey!", "Ho!"
    expect(dbl.hey!).to eq("Ho!")
  end

  it "allows stubbing multiple methods with hash syntax" do
    dbl = double("Person")
    # Note this uses #receive_messages, not #receive
    allow(dbl).to receive_messages(:full_name => 'Mary Smith', :initials => 'MTS')
    expect(dbl.full_name).to eq("Mary Smith")
    expect(dbl.initials).to eq("MTS")
  end
  
  it "allows stubbing with a hash argument to #double" do
    dbl = double("Person", :full_name => "Mary Smith", :initials => "MTS")
    expect(dbl.full_name).to eq("Mary Smith")
    expect(dbl.initials).to eq("MTS")
  end

  it "allows stubbing multiple responses with #and_return" do
    die = double("Die")
    allow(die).to receive(:roll).and_return(1,5,2,6)
    expect(die.roll).to eq(1)
    expect(die.roll).to eq(5)
    expect(die.roll).to eq(2)
    expect(die.roll).to eq(6)
    expect(die.roll).to eq(6)  # continues returning last value
  end

  context 'with partial test doubles' do

    it "allows stubbing instance methods on Ruby classes" do
      time = Time.new(2010, 1, 1, 12, 0, 0)
      allow(time).to receive(:year).and_return(1975)

      expect(time.to_s).to eq('2010-01-01 12:00:00 -0500')
      expect(time.year).to eq(1975)
    end

    it "allows stubbing instance methods on custom classes" do
      class SuperHero
        attr_accessor :name
      end

      hero = SuperHero.new
      hero.name = 'Superman'
    	expect(hero.name).to eq('Superman')

      allow(hero).to receive(:name).and_return('Clark Kent')

    	expect(hero.name).to eq('Clark Kent')
    end

    it "allows stubbing class methods on Ruby classes" do
      fixed = Time.new(2010, 1, 1, 12, 0, 0)
      allow(Time).to receive(:now).and_return(fixed)

      expect(Time.now).to eq(fixed)
      expect(Time.now.to_s).to eq('2010-01-01 12:00:00 -0500')
      expect(Time.now.year).to eq(2010)
    end

    it "allows stubbing database calls a mock object" do
      class Customer
        attr_accessor :name
        def self.find
          # database lookup, returns one object
        end
      end

      dbl = double('Mock Customer')
      allow(dbl).to receive(:name).and_return('Bob')

      allow(Customer).to receive(:find).and_return(dbl)

    	customer = Customer.find
      expect(customer.name).to eq('Bob')
    end

    it "allows stubbing database calls with many mock objects" do
      class Customer
        attr_accessor :name
        def self.all
          # database lookup, returns array of objects
        end
      end

      c1 = double('First Customer', :name => 'Bob')
    	c2 = double('Second Customer', :name => 'Mary')

      allow(Customer).to receive(:all).and_return([c1,c2])

    	customers = Customer.all
      expect(customers[1].name).to eq('Mary')
    end

  end

  context 'with message expectations' do
  
    it "expects a call and allows a response" do
      dbl = double("Chant")
      expect(dbl).to receive(:hey!).and_return("Ho!")
      dbl.hey!
    end
    
    it "does not matter which order" do
      dbl = double("Multi-step Process")

      expect(dbl).to receive(:step_1)
      expect(dbl).to receive(:step_2)

      dbl.step_2
      dbl.step_1
    end
    
    it "works with #ordered when order matters" do
      dbl = double("Multi-step Process")

      expect(dbl).to receive(:step_1).ordered
      expect(dbl).to receive(:step_2).ordered

      dbl.step_1
      dbl.step_2
    end
    
  end

  context 'with argument constraints' do

    it "expects arguments will match" do
      dbl = double("Customer List")
      expect(dbl).to receive(:sort).with('name')
      dbl.sort('name')
    end

    it "passes when any arguments are allowed" do
      dbl = double("Customer List")
      # The default if you don't use #with
      expect(dbl).to receive(:sort).with(any_args)
      dbl.sort('name')
    end

    it "works the same with multiple arguments" do
      dbl = double("Customer List")
      expect(dbl).to receive(:sort).with('name', 'asc', true)
      dbl.sort('name', 'asc', true)
    end

    it "allows contraining only some arguments" do
      dbl = double("Customer List")
      expect(dbl).to receive(:sort).with('name', anything, anything)
      dbl.sort('name', 'asc', true)
    end

    it "allows using other matchers" do
      dbl = double("Customer List")
      expect(dbl).to receive(:sort).with(
        a_string_starting_with('n'), 
        an_object_eq_to('asc') | an_object_eq_to('desc'), 
        boolean
      )
      dbl.sort('name', 'asc', true)
    end

  end

  context 'with message count constraints' do

    it "allows constraints on message count" do
      class Cart
        
        def initialize
          @items = []
        end
        
        def add_item(id)
          @items << id
        end
        
        def restock_item(id)
          @items.delete(id)
        end

        def empty
          @items.each {|id| restock_item(id) }
        end
      end
      
      cart = Cart.new
      cart.add_item(35)
      cart.add_item(178)

      expect(cart).to receive(:restock_item).twice
      cart.empty
    end
    
    it "allows using at_least/at_most" do
      post = double('BlogPost')
      expect(post).to receive(:like).at_least(3).times
      post.like(:user => 'Bob')
      post.like(:user => 'Mary')
      post.like(:user => 'Ted')
      post.like(:user => 'Jane')
    end
    
  end

  context 'with spying abilities' do
    
    it "can expect a call after it is received" do
      dbl = spy("Chant")
      allow(dbl).to receive(:hey!).and_return("Ho!")
      dbl.hey!
      expect(dbl).to have_received(:hey!)
    end

    it "can use message constraints" do
      dbl = spy("Chant")
      allow(dbl).to receive(:hey!).and_return("Ho!")
      dbl.hey!
      dbl.hey!
      dbl.hey!
      expect(dbl).to have_received(:hey!).with(no_args).exactly(3).times
    end
    
    it "can expect any message already sent to a declared spy" do
      customer = spy("Customer")
      # Notice that we don't stub :send_invoice
      # allow(customer).to receive(:send_invoice)
      customer.send_invoice
      expect(customer).to have_received(:send_invoice)
    end
    
    it "can expect only allowed messages on partial doubles" do
      class Customer
        def send_invoice
          true
        end
      end
      customer = Customer.new
      # Must stub :send_invoice to start spying
      allow(customer).to receive(:send_invoice)
      customer.send_invoice
      expect(customer).to have_received(:send_invoice)
    end
    
    context 'using let and a before hook' do
      let(:order) do
        spy('Order', :process_line_items => nil, 
                     :charge_credit_card => true, 
                     :send_confirmation_email => true)
      end
      
      before(:example) do
        order.process_line_items
        order.charge_credit_card
        order.send_confirmation_email
      end
      
      it 'calls #process_line_items on the order' do
        expect(order).to have_received(:process_line_items)
      end
      it 'calls #charge_credit_card on the order' do
        expect(order).to have_received(:charge_credit_card)
      end
      it 'calls #send_confirmation_email on the order' do
        expect(order).to have_received(:send_confirmation_email)
      end
    end
    
  end

end
