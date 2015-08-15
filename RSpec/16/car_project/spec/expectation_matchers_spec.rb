describe 'Expectation Matchers' do

  describe 'equivalence matchers' do

    it 'will match loose equality with #eq' do
      a = "2 cats"
      b = "2 cats"
      expect(a).to eq(b)
      expect(a).to be == b      # synonym for #eq

      c = 17
      d = 17.0
      expect(c).to eq(d)        # different types, but "close enough"
    end
    
    it 'will match value equality with #eql' do
      a = "2 cats"
      b = "2 cats"
      expect(a).to eql(b)       # just a little stricter

      c = 17
      d = 17.0
      expect(c).not_to eql(d)   # not the same, close doesn't count
    end

    it 'will match identity equality with #equal' do
      a = "2 cats"
      b = "2 cats"
      expect(a).not_to equal(b) # same value, but different object

      c = b
      expect(b).to equal(c)     # same object
      expect(b).to be(c)        # synonym for #equal
    end
    
  end

  describe 'truthiness matchers' do

    it 'will match true/false' do
      expect(1 < 2).to be(true)       # do not use 'be_true'
      expect(1 > 2).to be(false)      # do not use 'be_false'

      expect('foo').not_to be(true)   # the string is not exactly true
      expect(nil).not_to be(false)    # nil is not exactly false
      expect(0).not_to be(false)      # 0 is not exactly false
    end
    
    it 'will match truthy/falsey' do
      expect(1 < 2).to be_truthy
      expect(1 > 2).to be_falsey

      expect('foo').to be_truthy      # any value counts as true
      expect(nil).to be_falsey        # nil counts as false
      expect(0).not_to be_falsey      # but 0 is still not falsey enough
    end
    
    it 'will match nil' do
      expect(nil).to be_nil
      expect(nil).to be(nil)          # either way works
      
      expect(false).not_to be_nil     # nil only, just like #nil?
      expect(0).not_to be_nil         # nil only, just like #nil?
    end

  end
  
  describe 'numeric comparison matchers' do
  
    it 'will match less than/greater than' do
      expect(10).to be > 9
      expect(10).to be >= 10
      expect(10).to be <= 10
      expect(9).to be < 10
    end

    it 'will match numeric ranges' do
      expect(10).to be_between(5, 10).inclusive
      expect(10).not_to be_between(5, 10).exclusive
      expect(10).to be_within(1).of(11)
      expect(5..10).to cover(9)
    end

  end
  
  describe 'collection matchers' do
    
    it 'will match arrays' do
      array = [1,2,3]
      
      expect(array).to include(3)
      expect(array).to include(1,3)

      expect(array).to start_with(1)
      expect(array).to end_with(3)
      
      expect(array).to match_array([3,2,1])
      expect(array).not_to match_array([1,2])

      expect(array).to contain_exactly(3,2,1)   # similar to match_array
      expect(array).not_to contain_exactly(1,2) # but use individual args
    end

    it 'will match strings' do
      string = 'some string'
      
      expect(string).to include('ring')
      expect(string).to include('so', 'ring')
      
      expect(string).to start_with('so')
      expect(string).to end_with('ring')
    end
    
    it 'will match hashes' do
      hash = {:a => 1, :b => 2, :c => 3}
      
      expect(hash).to include(:a)
      expect(hash).to include(:a => 1)
      
      expect(hash).to include(:a => 1, :c => 3)
      expect(hash).to include({:a => 1, :c => 3})
      
      expect(hash).not_to include({'a' => 1, 'c' => 3})
    end
    
  end

  describe 'other useful matchers' do
  
    it 'will match strings with a regex' do
      # This matcher is a good way to "spot check" strings
      string = 'The order has been received.'
      expect(string).to match(/order(.+)received/)

      expect('123').to match(/\d{3}/)
      expect(123).not_to match(/\d{3}/) # only works with strings

      email = 'someone@somewhere.com'
      expect(email).to match(/\A\w+@\w+\.\w{3}\Z/)
    end

    it 'will match object types' do
      expect('test').to be_instance_of(String)
      expect('test').to be_an_instance_of(String) # alias of #be_instance_of

      expect('test').to be_kind_of(String)
      expect('test').to be_a_kind_of(String)  # alias of #be_kind_of
      expect('test').to be_a(String)          # alias of #be_kind_of
      expect([1,2,3]).to be_an(Array)         # alias of #be_kind_of
    end
    
    it 'will match objects with #respond_to' do
      string = 'test'
      expect(string).to respond_to(:length)
      expect(string).not_to respond_to(:sort)
    end

    it 'will match class instances with #have_attributes' do
      class Car
        attr_accessor :make, :year, :color
      end
      car = Car.new
      car.make = 'Dodge'
      car.year = 2010
      car.color = 'green'

      expect(car).to have_attributes(:color => 'green')
      expect(car).to have_attributes(
        :make => 'Dodge', :year => 2010, :color => 'green'
      )
    end
    
    it 'will match anything with #satisfy' do
      # This is the most flexible matcher
      expect(10).to satisfy do |value|
        (value >= 5) && (value <=10) && (value % 2 == 0)
      end
    end

  end
  
  describe 'predicate matchers' do
    
    it 'will match be_* to custom methods ending in ?' do
      # drops "be_", adds "?" to end, calls method on object
      # Can use these when methods end in "?", require no arguments, 
      # and return true/false.

      # with built-in methods
      expect([]).to be_empty                # [].empty?
      expect(1).to be_integer               # 1.integer?
      expect(0).to be_zero                  # 0.zero?
      expect(1).to be_nonzero               # 1.nonzero?
      expect(1).to be_odd                   # 1.odd?
      expect(2).to be_even                  # 1.even?
      
      # be_nil is actually an example of this too
      
      # with custom methods
      class Product
        def visible?; true; end
      end
      product = Product.new

      expect(product).to be_visible         # product.visible?
      expect(product.visible?).to be true   # exactly the same as this
    end

    it 'will match have_* to custom methods like has_*?' do
      # changes "have_" to "has_", adds "?" to end, calls method on object
      # Can use these when methods start with "has_", end in "?", 
      # and return true/false. Can have arguments, but not required.

      # with built-in methods
      hash = {:a => 1, :b => 2}
      expect(hash).to have_key(:a)          # hash.has_key?
      expect(hash).to have_value(2)         # hash.has_value?

      # with custom methods
      class Customer
        def has_pending_order?; true; end
      end
      customer = Customer.new

      expect(customer).to have_pending_order  # customer.has_pending_order?
      expect(customer.has_pending_order?).to be true  # same as this
    end
    
  end
  
end
