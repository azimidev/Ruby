# encoding: UTF-8

describe 'NumberHelper' do

  include NumberHelper
  
  describe '#number_to_currency' do
    
    context 'using default values' do
      
      it "correctly formats an integer" do
        expect(number_to_currency(2000)).to eq('$2,000.00')
      end
      
      it "correctly formats a float" do
        expect(number_to_currency(2000.00)).to eq('$2,000.00')
      end

      it "correctly formats a string" do
        expect(number_to_currency('2000')).to eq('$2,000.00')
      end
      
      it "uses delimiters for very large numbers" do
        expect(number_to_currency(2000000000)).to eq('$2,000,000,000.00')
      end

      it "does not have delimiters for small numbers" do
        expect(number_to_currency(200)).to eq('$200.00')
      end

    end
    
    context 'using custom options' do
      
      it 'allows changing the :unit' do
        expect(number_to_currency(2000, :unit => '£')).to eq('£2,000.00')
      end

      it 'allows changing the :precision' do
        expect(number_to_currency(2000, :precision => 1)).to eq('$2,000.0')
      end

      it 'omits the separator if :precision is 0' do
        expect(number_to_currency(2000, :precision => 0)).to eq('$2,000')
      end

      it 'allows changing the :delimiter' do
        expect(number_to_currency(2000, :delimiter => '.')).to eq('$2.000.00')
      end
      
      it 'allows changing the :separator' do
        expect(number_to_currency(2000, :separator => ',')).to eq('$2,000,00')
      end
      
      it 'correctly formats using multiple options' do
        expect(number_to_currency(2000, :unit => '£', :precision => 3, :delimiter => '.', :separator => ',')).to eq('£2.000,000')
      end
      
    end
    
  end
  
end
